import '/assetlib/asset_lib.dart';
import '/model/terrain_info.dart';
import '/model/vehicle_info.dart';
import '/services/db_service.dart';
import 'package:flutter/foundation.dart';

class GameViewProvider extends ChangeNotifier {
  //
  bool callOnce = true;
  //required
  int storedCoins;
  int storedTrash;
  DBService dbService;

  //fuel
  double fuelLeft = 100;
  List<double?> nextFuelX = [null];

  //progress
  int coinsCollected = 0;
  int trashCollected = 0;
  int distanceTravelled = 0;

  //game
  bool hasEnded = false;

  //speed
  double motorSpeed = 0;

  //vehicle
  final VehicleInfo vechicleInfo;
  final TerrainInfo terrainInfo;

  GameViewProvider(
      {required this.dbService,
      required this.storedCoins,
      required this.storedTrash,
      required this.vechicleInfo,
      required this.terrainInfo}) {
    init();
  }
  //

  Future<void> init() async {
    storedCoins = await dbService.getTotalCoinsStored();
  }

  //speed
  void setMotorSpeed(double s) {
    if (s < 0) {
      motorSpeed = 0;
    } else {
      motorSpeed = s;
    }
  }

  void setNextFuelLocation(double? x) {
    if (x != null) {
      nextFuelX.add(x);
      nextFuelX.removeAt(0);
    }

    notifyListeners();
  }

  double? getNextFuelDistance() {
    if (nextFuelX.first == null) {
      return null;
    }
    if (nextFuelX.last != null) {
      final tmp = nextFuelX.last! - distanceTravelled;
      return tmp < 0 ? 0 : tmp;
    }

    return 0;
  }

  void refuel() {
    fuelLeft = 100;
    nextFuelX[0] = null;
    notifyListeners();
  }

  void decrementFuel([double step = 0.03]) {
    if (fuelLeft - step <= 0) {
      fuelLeft = 0;
      gameEnd();
    } else {
      fuelLeft -= step;
    }
    notifyListeners();
  }

  void setDistanceTravelled(double posX) {
    if (posX <= 0) {
      distanceTravelled = 0;
    } else {
      distanceTravelled = posX.toInt();
    }
    notifyListeners();
  }

  Future<void> gameEnd() async {
    if (callOnce) {
      hasEnded = true;
      callOnce = false;
      save();
      notifyListeners();
    }
  }

  Future<void> save() async {
    if (distanceTravelled > terrainInfo.maxDistanceTravelled) {
      await dbService.saveGameProgress(
          terrainInfo.id, distanceTravelled, coinsCollected, trashCollected);
      terrainInfo.maxDistanceTravelled = distanceTravelled;
    } else {
      await dbService.saveGameProgress(
          terrainInfo.id, null, coinsCollected, trashCollected);
    }
  }

  //coins logic
  void incrementCoinCollected([int amount = 1]) {
    coinsCollected += amount;
    notifyListeners();
  }

  //trash logic
  void incrementTrashCollected([int amount = 1]) {
    trashCollected += amount;
    notifyListeners();
  }
}
