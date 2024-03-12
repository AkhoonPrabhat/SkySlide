import '/assetlib/asset_constants.dart';
import '/model/terrain_info.dart';
import '/model/vehicle_info.dart';
import '/services/db_service.dart';
import '/services/temp/collections.dart';
import 'package:flame_audio/flame_audio.dart';

import '/assetlib/asset_lib.dart';
import 'package:flutter/foundation.dart';

class AppProvider extends ChangeNotifier {
  final List<String> audioFiles = [
    AssetConstants.bgAudio,
    AssetConstants.jumpAudio,
    AssetConstants.trashCollectedAudio,
    AssetConstants.fuelCollectedAudio,
    AssetConstants.coinCollectedAudio
  ];
  bool isLoadingAssets = true;
  final AssetLib assetLib;
  DBService dbService;
  //
  int selectedVehicleIndex = 0;
  int selectedTerrainIndex = 0;

  //
  int selectedOptionIndex = 0;

  //
  int? storedCoins;
  int? storedTrash;

  //
  bool isAudioEnabled = false;

  AppProvider({required this.dbService, required this.assetLib}) {
    loadAssets();
  }

  Future<void> loadAssets() async {
    await getProgress();
    await loadAudioFiles();
    List<Terrain> terrains = await dbService.getAllTerrains();
    mapTerrainToTerrainInfo(terrains);
    isLoadingAssets = await assetLib.loadAssets();

    notifyListeners();
  }

  void mapTerrainToTerrainInfo(List<Terrain> terrains) {
    for (int i = 0; i < terrains.length; i++) {
      assetLib.terrainInfoArr[i].maxDistanceTravelled =
          terrains[i].maxDistanceTravelled;
    }
  }

  Future<void> loadAudioFiles() async {
    await FlameAudio.audioCache.loadAll(audioFiles);
    if (isAudioEnabled) {
      FlameAudio.bgm.play(AssetConstants.bgAudio);
    }
  }

  Future<void> getProgress() async {
    storedCoins = await dbService.getTotalCoinsStored();
    storedTrash = await dbService.getTotalTrashStored();
    notifyListeners();
  }

  void changeSelectedOption(int i) {
    selectedOptionIndex = i;
    notifyListeners();
  }

  void changeSelectedVehicleIndex(int i) {
    selectedVehicleIndex = i;
    notifyListeners();
  }

  void changeSelectedTerrainIndex(int i) {
    selectedTerrainIndex = i;
  }

  VehicleInfo getSelectedVehicle() {
    return assetLib.vehicleInfoArr[selectedVehicleIndex];
  }

  TerrainInfo getSelectedTerrain() {
    return assetLib.terrainInfoArr[selectedTerrainIndex];
  }

  void enableAudio() {
    isAudioEnabled = true;
    FlameAudio.bgm.play(AssetConstants.bgAudio);
    notifyListeners();
  }

  void disableAudio() {
    isAudioEnabled = false;
    FlameAudio.bgm.stop();
    notifyListeners();
  }
}
