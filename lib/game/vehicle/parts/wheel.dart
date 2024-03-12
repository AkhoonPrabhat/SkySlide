import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Wheel extends BodyComponent {
  final double r, x, y;
  final String path;
  Wheel(
      {this.r = 2.0,
      this.x = 0.0,
      this.y = 0.0,
      this.path = 'vehicles/wheel1.png'});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    renderBody = false;
    final spriteComponent = SpriteComponent(
        size: Vector2(r * 2.5, r * 2.5),
        anchor: Anchor.center,
        sprite: await Sprite.load(
          path,
          srcPosition: Vector2(0, 0),
        ));
    add(spriteComponent);
  }

  @override
  Body createBody() {
    final def = BodyDef(
      type: BodyType.dynamic,
      position: Vector2(x, y),
    );

    final shape = CircleShape()..radius = r;
    final fd = FixtureDef(shape, density: 2.4, friction: 3, restitution: 0.1);

    return world.createBody(def)
      ..createFixture(
        fd,
      );
  }
}
