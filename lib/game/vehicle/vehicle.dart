import '/model/vehicle_info.dart';
import 'parts/vehicle_body.dart';
import 'parts/wheel.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

enum Threshold { max, min }

class Vehicle extends Component with KeyboardHandler, CollisionCallbacks {
  final double x, y;
  VehicleInfo vehicleInfo;
  VechicleBody? vechicleBody;

  final Forge2DWorld world;
  WheelJoint? _wjFront;
  WheelJoint? _wjRear;

  Vehicle(
      {required this.world,
      this.x = 0,
      this.y = 0.0,
      required this.vehicleInfo});

  bool checkThreshold(Threshold type) {
    if (type == Threshold.max) {
      return _wjRear!.motorSpeed + vehicleInfo.motorSpeedStep >
          vehicleInfo.maxMotorSpeed;
    } else {
      return _wjRear!.motorSpeed - vehicleInfo.motorSpeedStep <
          -vehicleInfo.maxMotorSpeed;
    }
  }

  void forSpeed([double val = 0]) {
    if (checkThreshold(Threshold.max)) {
      return;
    } else {
      _wjRear!.motorSpeed += vehicleInfo.motorSpeedStep;
      _wjFront!.motorSpeed += vehicleInfo.motorSpeedStep;
    }
  }

  void setSpeed([double val = 0]) {
    _wjRear!.motorSpeed = 0.0;
    _wjFront!.motorSpeed = 0.0;
    _wjRear!.setMaxMotorTorque(_wjRear!.getMaxMotorTorque());
  }

  void revSpeed([double val = 0]) {
    if (checkThreshold(Threshold.min)) {
      return;
    } else {
      _wjRear!.motorSpeed -= vehicleInfo.motorSpeedStep;
      _wjFront!.motorSpeed -= vehicleInfo.motorSpeedStep;
      _wjFront!.setMaxMotorTorque(_wjFront!.getMaxMotorTorque());
    }
  }

  void jump() {
    if (vechicleBody != null) {
      vechicleBody!.body.applyLinearImpulse(Vector2(0, -10) * 100,
          point: vechicleBody!.body.position);
    }
  }

  @override
  Future<void> onLoad() async {
    debugMode = true;

    vechicleBody = VechicleBody(
      x: x,
      y: y,
      w: vehicleInfo.w,
      h: vehicleInfo.h,
      sprite: vehicleInfo.sprite!,
    );
    var frontWheel = Wheel(
        r: vehicleInfo.r,
        x: x + vehicleInfo.fronWheelHorizontalOffset,
        y: y + vehicleInfo.wheelVerticalOffset);
    var rearWheel = Wheel(
        r: vehicleInfo.r,
        x: x - vehicleInfo.rearWheelHorizontalOffset,
        y: y + vehicleInfo.wheelVerticalOffset);

    await world.add(vechicleBody!);
    await world.add(rearWheel);
    await world.add(frontWheel);

    final wjd = WheelJointDef();
    wjd.enableMotor = true;
    wjd.collideConnected = false;
    wjd.maxMotorTorque = vehicleInfo.maxMotorTorque;
    wjd.dampingRatio = vehicleInfo.dampingRatio;
    wjd.frequencyHz = vehicleInfo.frequencyHz;
    wjd.motorSpeed = vehicleInfo.motorSpeed;

    wjd.initialize(vechicleBody!.body, rearWheel.body, rearWheel.body.position,
        Vector2(0, 1.0));
    _wjRear = WheelJoint(wjd);
    world.createJoint(_wjRear!);

    wjd.initialize(vechicleBody!.body, frontWheel.body,
        frontWheel.body.position, Vector2(0, 1.0));
    _wjFront = WheelJoint(wjd);
    world.createJoint(_wjFront!);

    // double hPlayer = 4;
    // double wPlayer = 2;
    // final head = HeadComponent(x: x, y: y - hPlayer / 1.4, r: 0.7);
    // final pBody = PBodyComponent(
    //     x: x, y: y - hPlayer / 3, h: hPlayer / 3, w: wPlayer / 3);

    // await world.add(head);
    // await world.add(pBody);

    // RevoluteJointDef rjd = RevoluteJointDef();

    // rjd.lowerAngle = 0;
    // rjd.upperAngle = 0;
    // rjd.enableMotor = false;
    // rjd.enableLimit = true;

    // rjd.initialize(pBody.body, head.body, head.position);
    // world.createJoint(RevoluteJoint(rjd..collideConnected = false));

    // rjd.lowerAngle = -pi / 20;
    // rjd.upperAngle = pi / 20;
    // rjd.maxMotorTorque = 100.0;
    // rjd.enableLimit = true;

    // rjd.initialize(vechicleBody!.body, pBody.body, pBody.position..y += h / 4);
    // world.createJoint(RevoluteJoint(rjd..collideConnected = false));
  }
}
