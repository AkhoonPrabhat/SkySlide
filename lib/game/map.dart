// import 'dart:js';
import 'dart:math';

import '/assetlib/asset_lib.dart';
import '/game/background_sprite_component.dart';
import '/providers/game_view_provider.dart';
import '/game/terrain/perlin_noise.dart';
import '/game/terrain/terrain_chunk.dart';
import '/game/vehicle/vehicle.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

//
import '../collectible/coin.dart';
import '../collectible/fuel.dart';
import '../collectible/trash.dart';

class Map extends Component with HasGameRef<Forge2DGame> {
  final Forge2DWorld world;

  int _lastGeneratedX = 0;
  final int _chunkWidth = 600;
  final int _chunkPrecision = 80;
  final List<int> terrainSeedArr = List.empty(growable: true);
  final List<TerrainChunk> _terrainChunkArr = List.empty(growable: true);
  final double _collectibleOffset = 3;
  final int steps = 10;
  Vehicle vehicle;
  final BuildContext context;
  final GameViewProvider gameViewProvider;
  final int _yThreshold = 200;

  Map({required this.world, required this.context, required this.vehicle})
      : gameViewProvider =
            Provider.of<GameViewProvider>(context, listen: false) {
    _generateMap();
  }

  void _generateMap() {
    final noise = perlinNoise.noise1D(
        n: _chunkPrecision,
        seed: gameViewProvider.terrainInfo.seed *
            (_lastGeneratedX ~/ _chunkWidth),
        octaves: 3,
        lacunarity: 2,
        persistence: 0.04);

    final vertices = _noiseToVector2(_lastGeneratedX, noise);
    _generateTerrain(vertices);

    if (_lastGeneratedX ~/ _chunkWidth % 3 == 0 && _lastGeneratedX != 0) {
      _generateCollectibles(vertices);
    }
    _generateBackground(vertices[getRandomIndex(vertices.length)].x);
  }

  List<Vector2> _noiseToVector2(int x, List<double> noise) {
    const worldScale = 6;
    const scalingFactor = 10;
    const bias = 50;
    final List<Vector2> res = [];

    for (int i = 0; i < _chunkPrecision; i++) {
      res.add(Vector2(
          (x / worldScale) +
              (_chunkWidth / (_chunkPrecision * worldScale)) * i -
              bias,
          noise[i] * scalingFactor));
    }

    return res;
  }

  void _generateCollectibles(List<Vector2> vertices) async {
    _generateFuel(vertices[steps - steps ~/ 3].x,
        vertices[steps - steps ~/ 3].y - _collectibleOffset);

    int i = steps;

    while (i < _chunkPrecision - _chunkPrecision / 2) {
      await world.add(Coin(
          x: vertices[i].x,
          y: vertices[i].y - _collectibleOffset,
          sprite: assetLib.iconSprites[0]));

      i += 3;
    }

    _generateTrash(vertices[i + 2].x, vertices[i + 2].y - _collectibleOffset);
  }

  void _generateFuel(double x, double y) {
    world.add(
        Fuel(x: x, y: y, sprite: gameViewProvider.terrainInfo.fuelSprite!));
    gameViewProvider.setNextFuelLocation(x);
  }

  void _generateTrash(double x, double y) {
    world.add(Trash(x: x, y: y, sprite: assetLib.iconSprites[1]));
  }

  void _generateTerrain(List<Vector2> vertices) {
    final terrainChunk = TerrainChunk(vertices: vertices);
    world.add(terrainChunk);
    _terrainChunkArr.add(terrainChunk);
    _lastGeneratedX += _chunkWidth;
  }

  void _generateBackground(double x) async {
    if (isProbable()) {
      final randomY = getRandomY();
      final randomIndex =
          getRandomIndex(gameViewProvider.terrainInfo.sprites.length);
      await world.add(BackgroundSpriteComponent(
          priority_: -2,
          position: Vector2(x, randomY + vehicle.vechicleBody!.y),
          size: Vector2(6.0, 6.0),
          sprite: gameViewProvider.terrainInfo.sprites[randomIndex]));

      await world.add(BackgroundSpriteComponent(
          priority_: -2,
          position: Vector2(x, vehicle.vechicleBody!.y + randomY + 3),
          size: Vector2(12, 8),
          sprite:
              // gameViewProvider.terrainInfo.sprites[randomIndex])
              assetLib
                  .cloudSprites[getRandomIndex(assetLib.cloudSprites.length)]));
    } else {
      null;
    }
  }

  double getRandomY() {
    int scalingFactor = 6;
    final tmp = Random(gameViewProvider.terrainInfo.seed * 45).nextDouble() *
        scalingFactor;
    return tmp;
  }

  int getRandomIndex(int n) {
    return Random(gameViewProvider.terrainInfo.seed).nextInt(n);
  }

  bool isProbable() {
    if (Random().nextDouble() < 0.7) {
      return true;
    } else {
      return false;
    }
  }

  void _destroy() {
    world.remove(_terrainChunkArr[0]);
    _terrainChunkArr.removeAt(0);
  }

  @override
  void update(double dt) {
    if (context.mounted && !gameViewProvider.hasEnded) {
      gameViewProvider.setDistanceTravelled(
          vehicle.vechicleBody!.body.position.x.roundToDouble());
      gameViewProvider.decrementFuel();
    }

    if (vehicle.vechicleBody!.body.position.y.abs() > _yThreshold) {
      gameViewProvider.gameEnd();
    }

    if (gameViewProvider.hasEnded) {
      vehicle.setSpeed();
    } else {
      gameViewProvider.setMotorSpeed(vehicle.vehicleInfo.motorSpeed);
    }

    if (_lastGeneratedX - vehicle.vechicleBody!.body.position.x * 6.83 <
        gameRef.size.x) {
      _generateMap();
      _lastGeneratedX % 500 == 0 ? _destroy() : null;
    }
  }
}
