import './collectible.dart';

class Coin extends Collectible {
  @override
  Coin({super.x, super.y, super.w = 1.2, super.h = 1.2, required super.sprite});
}
