import 'package:flame/components.dart';

class BackgroundSpriteComponent extends SpriteComponent {
  BackgroundSpriteComponent(
      {int priority_ = -1,
      required super.position,
      required super.size,
      required super.sprite}) {
    priority = priority_;
  }
}
