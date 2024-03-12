import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class VechicleBody extends BodyComponent with CollisionCallbacks {
  final double x, y;
  final double w, h;
  final Sprite sprite;

  VechicleBody(
      {this.x = 0,
      this.y = 0.0,
      this.w = 10,
      this.h = 4,
      required this.sprite});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    renderBody = false;

    final spriteComponent = SpriteComponent(
        size: Vector2(w, h), anchor: Anchor.center, sprite: sprite);
    add(spriteComponent);
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef();
    renderBody = false;
    bodyDef.position = Vector2(x, y);
    bodyDef.type = BodyType.dynamic;
    bodyDef.angularDamping = 0.8;
    bodyDef.linearDamping = 0.2;
    bodyDef.userData = this;

    final shape = PolygonShape();

    shape.setAsBoxXY(
      w / 2,
      h / 2,
    );

    final fixtureDef = FixtureDef(
      shape,
      restitution: 0.2,
      friction: 0.4,
      density: 3.5,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
