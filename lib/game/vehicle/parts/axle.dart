import 'package:flame_forge2d/flame_forge2d.dart';

class Axle extends BodyComponent {
  final double x, y, w, h;

  Axle({this.x = 0.0, this.y = 0.0, this.w = 5.0, this.h = 5.0});
  @override
  Body createBody() {
    final def = BodyDef(type: BodyType.dynamic, position: Vector2(x, y));
    final shape = PolygonShape()..setAsBoxXY(w / 2, h / 2);
    final fd = FixtureDef(shape, density: 0.5, friction: 3, restitution: 0.8);

    return world.createBody(def)..createFixture(fd);
  }
}
