import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';

class Collectible extends BodyComponent with CollisionCallbacks {
  double x, y, w, h;
  final Sprite sprite;
  //fading
  bool _isFading = false;
  final double _displacementStep = 0.08;
  final double _opacityStep = 0.01;
  SpriteComponent? _spriteComponent;

  Collectible(
      {this.x = 0,
      this.y = 0,
      this.w = 1.5,
      this.h = 1.5,
      required this.sprite});

  void destroy([bool val = true]) {
    _isFading = val;
  }

  @override
  @mustCallSuper
  Future onLoad() async {
    super.onLoad();
    renderBody = false;
    _spriteComponent = SpriteComponent(
        size: Vector2(w * 2, h * 2),
        anchor: Anchor.center,
        sprite: sprite..srcPosition = Vector2(0, 0));
    add(_spriteComponent!);

    debugMode = false;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (_isFading) {
      position.y -= _displacementStep;
      opacity -= _opacityStep;
      _spriteComponent != null
          ? _spriteComponent!.opacity -= _opacityStep
          : null;
    }

    if (opacity - _opacityStep < 0) {
      _isFading = false;
      world.remove(this);
    }
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef();
    bodyDef.position = Vector2(x, y);
    bodyDef.userData = this;
    bodyDef.type = BodyType.static;

    final shape = CircleShape()..radius = w;
    final fixtureDef = FixtureDef(shape);
    fixtureDef.isSensor = true;
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
