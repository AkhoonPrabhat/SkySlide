import 'dart:ui';

import 'package:flame_forge2d/flame_forge2d.dart';

class TerrainChunk extends BodyComponent {
  final List<Vector2> vertices;

  TerrainChunk({required this.vertices});

  @override
  Body createBody() {
    final BodyDef bodyDef = BodyDef();
    bodyDef.userData = this;
    ChainShape chain = ChainShape();
    chain.createChain(vertices);
    chain.radius = 3.0;
    paint = Paint()..color = const Color(0xffC0C0C0);

    FixtureDef fd = FixtureDef(chain);
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    return world.createBody(bodyDef)..createFixture(fd);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    for (int i = 0; i < vertices.length - 1; i++) {
      final Vector2 p1 = vertices[i];
      final Vector2 p2 = vertices[i + 1];
      canvas.drawLine(
          Offset(p1.x, p1.y), Offset(p2.x, p2.y), paint..strokeWidth = 0.2);
    }
  }
}
