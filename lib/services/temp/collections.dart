import 'package:isar/isar.dart';

part 'collections.g.dart';

@collection
class Progress {
  Id id = Isar.autoIncrement;
  int coinStored = 0;
  int trashStored = 0;
}

@collection
class Terrain {
  Id id = Isar.autoIncrement;
  late String name;
  late int maxDistanceTravelled;
}

// @collection
// class Vehicle {
//   Id id = Isar.autoIncrement;
//   late String name;
//   late int engine;
//   late int suspension;
//   late int wheel;
//   late int brake;
// }
