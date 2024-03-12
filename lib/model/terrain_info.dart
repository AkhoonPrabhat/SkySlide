import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class TerrainInfo {
  final int id;
  final String name;
  int maxDistanceTravelled;
  final int seed;
  final Color bgColor;
  final String bgImagePath;
  Sprite? fuelSprite;
  List<String> spritePath;
  List<Sprite> sprites = [];
  TerrainInfo(
      {required this.id,
      required this.name,
      required this.bgColor,
      required this.maxDistanceTravelled,
      required this.seed,
      this.fuelSprite,
      required this.spritePath,
      required this.bgImagePath});
}
