import '/assetlib/asset_lib.dart';
import 'temp/collections.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DBService {
  late Future<Isar> db;

  DBService();

  Future<void> initDB() async {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      try {
        final dir = await getApplicationDocumentsDirectory();
        final isar = await Isar.open(
          [
            ProgressSchema,
            TerrainSchema,
          ],
          directory: dir.path,
          inspector: true,
        );
        if (await isar.progress.count() == 0 &&
            await isar.terrains.count() == 0) {
          await setProgress(Progress(), isar);
          await addTerrains(
              assetLib.terrainInfoArr
                  .map((terrainInfo) => Terrain()
                    ..id = terrainInfo.id
                    ..maxDistanceTravelled = 0
                    ..name = terrainInfo.name)
                  .toList(),
              isar);
        }

        return isar;
      } catch (e) {
        // print("Error: $e");
      }
    }
    return Future.value(Isar.getInstance());
  }

  static Future<void> setProgress(Progress initialProgress, Isar db) async {
    await db.writeTxn(() async {
      await db.progress.put(initialProgress);
    });
  }

  static Future<void> addTerrains(List<Terrain> terrains, Isar db) async {
    await db.writeTxn(() async {
      for (Terrain terrain in terrains) {
        await db.terrains.put(terrain);
      }
    });
  }

  Future<bool> decreaseTotalCoins(int coinsToBeDecreased) async {
    final isar = await db;
    final record = await isar.progress.get(1);
    try {
      await isar.writeTxn(() async {
        record!.coinStored = record.coinStored - coinsToBeDecreased;
        isar.progress.put(record);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> increaseTotalCoins(int coinsToBeIncreased) async {
    final isar = await db;
    final record = await isar.progress.get(1);
    try {
      await isar.writeTxn(() async {
        record!.coinStored = record.coinStored + coinsToBeIncreased;
        isar.progress.put(record);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> decreaseTotalTrash(int trashToBeDecreased) async {
    final isar = await db;
    final record = await isar.progress.get(1);
    try {
      await isar.writeTxn(() async {
        record!.trashStored = record.trashStored - trashToBeDecreased;
        isar.progress.put(record);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> increaseTotalTrash(int trashToBeIncreased) async {
    final isar = await db;
    final record = await isar.progress.get(1);
    try {
      await isar.writeTxn(() async {
        record!.trashStored = record.trashStored + trashToBeIncreased;
        isar.progress.put(record);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveGameProgress(int gameId, int? maxDistanceTravelled,
      int totalCoinsCollected, int totalTrashCollected) async {
    final isar = await db;
    if (maxDistanceTravelled != null) {
      await isar.writeTxn(() async {
        final record = await isar.terrains.get(gameId);
        record!.maxDistanceTravelled = maxDistanceTravelled;
        isar.terrains.put(record);
      });
    }

    isar.writeTxn(() async {
      final record = await isar.progress.get(1);
      record!.coinStored += totalCoinsCollected;
      record.trashStored += totalTrashCollected;
      isar.progress.put(record);
    });
  }

  // Future<void> upgradeLevel(int gameID, String upgradeType) async {
  //   final isar = await db;
  //   isar.writeTxn(() async {
  //     final record = await isar.vehicles.get(gameID);
  //     if (upgradeType == 'engine' && record!.engine <= 10) {
  //       record.engine++;
  //     } else if (upgradeType == 'suspension' && record!.suspension <= 10) {
  //       record.suspension++;
  //     } else if (upgradeType == 'wheel' && record!.wheel <= 10) {
  //       record.wheel++;
  //     } else if (upgradeType == 'brake' && record!.brake <= 10) {
  //       record.brake++;
  //     }
  //     isar.vehicles.put(record!);
  //   });
  // }

  // Future<void> degradeLevel(int gameID, String degradeType) async {
  //   final isar = await db;
  //   isar.writeTxn(() async {
  //     final record = await isar.vehicles.get(gameID);
  //     if (degradeType == 'engine' && record!.engine >= 0) {
  //       record.engine--;
  //     } else if (degradeType == 'suspension' && record!.suspension >= 0) {
  //       record.suspension--;
  //     } else if (degradeType == 'wheel' && record!.wheel >= 0) {
  //       record.wheel--;
  //     } else if (degradeType == 'brake' && record!.brake >= 0) {
  //       record.brake--;
  //     }
  //     isar.vehicles.put(record!);
  //   });
  // }

  // Future<List<Vehicle>> getAllVehicles() async {
  //   final isar = await db;
  //   // IsarCollection<Vehicle> vehiclesCollection = isar.collection<Vehicle>();
  //   return await isar.vehicles.where().findAll();
  // }

  Future<List<Terrain>> getAllTerrains() async {
    final isar = await db;
    return await isar.terrains.where().findAll();
  }

  Future<int> getTotalCoinsStored() async {
    final isar = await db;
    final progress = await isar.progress.get(1);
    final totalCoinsStored = progress!.coinStored;
    return totalCoinsStored;
  }

  Future<int> getTotalTrashStored() async {
    final isar = await db;
    final progress = await isar.progress.get(1);
    final totalTrashStored = progress!.trashStored;
    return totalTrashStored;
  }
}
