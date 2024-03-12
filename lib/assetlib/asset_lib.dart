import '/model/terrain_info.dart';
import 'package:flutter/material.dart';

import '/model/vehicle_info.dart';
import 'package:flame/components.dart';

AssetLib assetLib = AssetLib();

class AssetLib {
  final List<VehicleInfo> vehicleInfoArr = [
    VehicleInfo(
      id: 0,
      w: 9,
      h: 3,
      r: 1.2,
      vehicleName: "cybertruck",
      motorSpeed: 0,
      motorSpeedStep: 2000,
      maxMotorSpeed: 20000.0,
      maxMotorTorque: 600,
      dampingRatio: 0.8,
      wheelVerticalOffset: 1.44,
      fronWheelHorizontalOffset: 3.25,
      rearWheelHorizontalOffset: 2.7,
      bgColor: Color.fromARGB(255, 130, 130, 130),
    ),
    VehicleInfo(
        id: 1,
        w: 9,
        h: 3,
        r: 1.2,
        vehicleName: "pickuptruck",
        motorSpeed: 0,
        motorSpeedStep: 5500,
        maxMotorSpeed: 55000.0,
        maxMotorTorque: 400,
        dampingRatio: 0.6,
        wheelVerticalOffset: 1.8,
        rearWheelHorizontalOffset: 2.5,
        fronWheelHorizontalOffset: 3.0,
        bgColor: const Color(0xff088F8F)),
    VehicleInfo(
        id: 2,
        w: 9,
        h: 4,
        r: 1.5,
        vehicleName: "monstertruck",
        motorSpeed: 0,
        motorSpeedStep: 20000,
        maxMotorSpeed: 200000.0,
        maxMotorTorque: 800,
        dampingRatio: 0.5,
        wheelVerticalOffset: 2.0,
        fronWheelHorizontalOffset: 2.8,
        rearWheelHorizontalOffset: 2.5,
        bgColor: const Color(0xff50C878)),
    VehicleInfo(
        id: 3,
        w: 12,
        h: 6,
        r: 1.2,
        vehicleName: "trashtruck",
        motorSpeed: 0,
        motorSpeedStep: 20000,
        maxMotorSpeed: 20000,
        maxMotorTorque: 900,
        dampingRatio: 0.8,
        wheelVerticalOffset: 3.0,
        fronWheelHorizontalOffset: 3.6,
        rearWheelHorizontalOffset: 2.8,
        bgColor: const Color(0xff355E3B))
  ];

  final List<TerrainInfo> terrainInfoArr = [
    TerrainInfo(
        id: 0,
        name: "Solar",
        bgColor: const Color(0xffE1C16E),
        maxDistanceTravelled: 0,
        seed: 20,
        bgImagePath: "assets/images/fuelIcons/solar.png",
        spritePath: ["terrains/solar/panel1.png", "terrains/solar/panel1.png"]),
    TerrainInfo(
        id: 1,
        name: "Wind",
        bgColor: Color.fromARGB(255, 44, 44, 44),
        maxDistanceTravelled: 0,
        seed: 14,
        bgImagePath: "assets/images/fuelIcons/wind.png",
        spritePath: [
          "terrains/wind/hotairballoon1.png",
          "terrains/wind/hotairballoon2.png",
          "terrains/wind/windmill.png"
        ]),
    TerrainInfo(
        id: 2,
        name: "Hydro",
        bgColor: Color.fromARGB(255, 1, 133, 169),
        maxDistanceTravelled: 0,
        seed: 51,
        bgImagePath: "assets/images/fuelIcons/hydro.png",
        spritePath: ["terrains/hydro/lifebuoy.png", "terrains/hydro/boat.png"]),
    TerrainInfo(
        id: 3,
        name: "Biomass",
        bgColor: const Color(0xff228b22),
        maxDistanceTravelled: 0,
        seed: 26,
        bgImagePath: "assets/images/fuelIcons/biomass.png",
        spritePath: [
          "terrains/biomass/rock.png",
          "terrains/biomass/farmhouse.png"
        ]),
    TerrainInfo(
        id: 4,
        name: "Geothermal",
        bgColor: const Color(0xffCC5500),
        maxDistanceTravelled: 0,
        seed: 59,
        bgImagePath: "assets/images/fuelIcons/geothermal.png",
        spritePath: ["terrains/geothermal/well.png"]),
    TerrainInfo(
        id: 5,
        name: "Ocean",
        bgColor: const Color(0xff095859),
        maxDistanceTravelled: 0,
        seed: 61,
        bgImagePath: "assets/images/fuelIcons/ocean.png",
        spritePath: [
          "terrains/ocean/surf2.png",
          "terrains/ocean/shrub.png",
          "terrains/ocean/octopus.png",
          "terrains/ocean/dolphin.png",
          "terrains/ocean/crab.png",
          "terrains/ocean/seaweed.png",
          "terrains/ocean/submarine.png"
        ]),
  ];

  final List<Sprite> iconSprites = [];
  final List<Sprite> cloudSprites = [];
  final List<Sprite> fogSprites = [];
  final List<Sprite> generalSprites = [];

  Future<bool> loadAssets() async {
    await _loadIcons();
    await _loadVehicles();
    await _loadTerrains();
    await _loadClouds();
    // await _loadGeneral();
    return false;
  }

  Future<void> _loadVehicles() async {
    for (int i = 0; i < vehicleInfoArr.length; i++) {
      vehicleInfoArr[i].sprite = await Sprite.load(
        "vehicles/${vehicleInfoArr[i].vehicleName}.png",
        srcPosition: Vector2(0, 0),
      );
    }
  }

  Future<void> _loadTerrains() async {
    TerrainInfo tmp;
    for (int i = 0; i < terrainInfoArr.length; i++) {
      tmp = terrainInfoArr[i];
      for (int j = 0; j < tmp.spritePath.length; j++) {
        terrainInfoArr[i].sprites.add(await Sprite.load(tmp.spritePath[j]));
      }
      terrainInfoArr[i].fuelSprite = await Sprite.load(
          "fuelIcons/${terrainInfoArr[i].name.toLowerCase()}.png");
    }
  }

  Future<void> _loadIcons() async {
    iconSprites.addAll([
      await Sprite.load("coin.png"),
      await Sprite.load("trash.png"),
    ]);
  }

  Future<void> _loadClouds() async {
    for (int i = 1; i < 7; i++) {
      cloudSprites.add(await Sprite.load("clouds/cloud$i.png")
        ..originalSize);
    }
  }

  // Future<void> _loadGeneral() async {}
}
