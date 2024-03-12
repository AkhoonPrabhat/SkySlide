import 'package:flame_forge2d/flame_forge2d.dart';

class HeadComponent extends BodyComponent {
  double x, y, r;

  HeadComponent({this.x = 0, this.y = 0, this.r = 0});
  @override
  Body createBody() {
    BodyDef bodyDef = BodyDef();
    bodyDef.type = BodyType.dynamic;
    bodyDef.position = Vector2(x, y);
    bodyDef.userData = this;

    final shape = CircleShape()..radius = r;
    final fixtureDef = FixtureDef(
      shape,
      density: 1,
      friction: 0.5,
      restitution: 0.5,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}

class PBodyComponent extends BodyComponent {
  double x, y, w, h;

  PBodyComponent({this.x = 0, this.y = 0, this.w = 1, this.h = 3});
  @override
  Body createBody() {
    BodyDef bodyDef = BodyDef();
    bodyDef.type = BodyType.dynamic;
    bodyDef.position = Vector2(x, y);
    final shape = PolygonShape()..setAsBoxXY(w / 2, h / 2);
    final fixtureDef = FixtureDef(
      shape,
      density: 1.0,
      friction: 0.5,
      restitution: 0.5,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
