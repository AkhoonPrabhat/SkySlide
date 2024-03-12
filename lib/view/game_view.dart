import '/model/terrain_info.dart';
import 'package:flame_audio/flame_audio.dart';

import '/providers/app_provider.dart';
import '/view/overlays/pause_menu_overlay.dart';

import '../game/contact_logic.dart';
import '/model/vehicle_info.dart';
import '/providers/game_view_provider.dart';
import '/services/db_service.dart';
import '../game/vehicle/vehicle.dart';
import '/view/overlays/game_end_indicator_overlay.dart';
import '/view/overlays/game_play_overlay.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../game/map.dart';

//overlays
import './overlays/game_end_overlay.dart';

class GameView extends StatelessWidget {
  final VehicleInfo vehicleInfo;
  final TerrainInfo terrainInfo;
  final DBService dbService;
  final int storedCoins, storedTrash;

  const GameView(
      {super.key,
      required this.dbService,
      required this.storedCoins,
      required this.storedTrash,
      required this.vehicleInfo,
      required this.terrainInfo});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameViewProvider(
          dbService: dbService,
          storedCoins: storedCoins,
          storedTrash: storedTrash,
          vechicleInfo: vehicleInfo,
          terrainInfo: terrainInfo),
      child: const GameComponent(),
    );
  }
}

class GameComponent extends StatelessWidget {
  const GameComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget.controlled(gameFactory: () => SkyClimb(context: context));
  }
}

class SkyClimb extends Forge2DGame
    with TapCallbacks, HasKeyboardHandlerComponents, HasGameRef<Forge2DGame> {
  final BuildContext context;
  final GameViewProvider gameViewProvider;

  bool _callOnce = true;
  SkyClimb({required this.context})
      : gameViewProvider =
            Provider.of<GameViewProvider>(context, listen: false);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    FlameAudio.bgm.pause();

    camera.viewfinder.scale = Vector2(size.x / 6.83 / 8, size.x / 6.83 / 8);
    camera.viewport.position = Vector2(0, 50);
    //contactListener
    world.physicsWorld.setContactListener(
        ContactLogic(gameViewProvider: gameViewProvider, context: context));

    //adding bodies
    final vehicle = Vehicle(
        world: world, x: 0, y: -20, vehicleInfo: gameViewProvider.vechicleInfo);
    await world.add(vehicle);
    final map = Map(context: context, world: world, vehicle: vehicle);
    await world.add(map);
    camera.follow(vehicle.vechicleBody!);

    //adding controls
    await world.add(KeyboardController(
        vehicle: vehicle, gameViewProvider: gameViewProvider));

    //overlays
    overlays.addEntry(
        "gameEndOverlay",
        (context, game) => GameEndOverlay(
              onTapCallback: () {
                Navigator.pop(context);
              },
            ));
    overlays.addEntry(
        "gamePlayOverlay",
        (context, game) => GamePlayOverlay(
              fuelIconPath:
                  "assets/images/fuelIcons/${gameViewProvider.terrainInfo.name.toLowerCase()}.png",
              vehicle: vehicle,
              onPauseMenuButtonPressed: () {
                overlays.add("gameEndIndicatorOverlay");
                overlays.add("pauseMenuOverlay");

                gameRef.pauseEngine();
              },
            ));
    overlays.addEntry("gameEndIndicatorOverlay",
        (context, game) => const GameEndIndicatorOverlay());
    overlays.addEntry(
        "pauseMenuOverlay",
        (context, game) => PauseMenuOverlay(
              onCancelCallback: () {
                gameRef.resumeEngine();
                overlays.remove("pauseMenuOverlay");
                overlays.remove("gameEndIndicatorOverlay");
              },
              onExitCallback: () {
                Navigator.pop(context);
              },
              onResumeCallback: () {
                gameRef.resumeEngine();
                overlays.remove("pauseMenuOverlay");
                overlays.remove("gameEndIndicatorOverlay");
              },
              onRestartCallback: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                              body: GameView(
                                dbService: gameViewProvider.dbService,
                                storedCoins: gameViewProvider.storedCoins,
                                storedTrash: gameViewProvider.storedTrash,
                                vehicleInfo: Provider.of<AppProvider>(context,
                                        listen: false)
                                    .getSelectedVehicle(),
                                terrainInfo: Provider.of<AppProvider>(context,
                                        listen: false)
                                    .getSelectedTerrain(),
                              ),
                            )));
              },
            ));
    //adding overlay
    overlays.add("gamePlayOverlay");
  }

  @override
  void onGameResize(Vector2 size) {
    camera.viewfinder.scale = Vector2(size.x / 6.83 / 7, size.x / 6.83 / 7);
    super.onGameResize(size);
  }

  @override
  Color backgroundColor() =>
      gameViewProvider.terrainInfo.bgColor.withAlpha(150);

  @override
  void update(double dt) {
    if (gameViewProvider.hasEnded) {
      _callOnce = false;
      camera.viewfinder.zoom += 0.1;
      if (!_callOnce) {
        overlays.add("gameEndIndicatorOverlay");
        Future.delayed(const Duration(seconds: 3), () {
          gameRef.pauseEngine();

          overlays.add("gameEndOverlay");
        });
      }
    }
    super.update(dt);
  }
}

class KeyboardController extends Component with KeyboardHandler {
  Vehicle vehicle;
  GameViewProvider gameViewProvider;
  KeyboardController({required this.vehicle, required this.gameViewProvider});

  @override
  bool onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isUp = event is KeyUpEvent;
    final isDown = event is KeyDownEvent;
    if (gameViewProvider.hasEnded) {
      null;
      return true;
    }

    if (isUp) {
      vehicle.setSpeed();
    } else if (isDown) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        vehicle.revSpeed();
      } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        vehicle.forSpeed();
      } else {
        vehicle.setSpeed();
      }
    }

    return true;
  }
}
