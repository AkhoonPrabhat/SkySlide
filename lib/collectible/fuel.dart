
import './collectible.dart';

class Fuel extends Collectible {
  Fuel({
    super.x,
    super.y,
    super.w = 1.2,
    super.h = 1.2,
    required super.sprite,
  });
}

//TODO:Game slow due to again again loading sprites