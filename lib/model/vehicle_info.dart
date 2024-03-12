import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';

class VehicleInfo {
  final int id;
  final double r;
  final String vehicleName;
  final double w, h;
  final double motorSpeed;
  final double motorSpeedStep;
  final double maxMotorSpeed;
  final double wheelVerticalOffset;
  final double rearWheelHorizontalOffset;
  final double fronWheelHorizontalOffset;
  final double dampingRatio;
  final double frequencyHz;
  final double maxMotorTorque;
  final Color bgColor;
  Sprite? sprite;

  VehicleInfo(
      {required this.id,
      required this.w,
      required this.h,
      required this.r,
      required this.vehicleName,
      required this.motorSpeed,
      required this.motorSpeedStep,
      required this.maxMotorSpeed,
      required this.wheelVerticalOffset,
      required this.rearWheelHorizontalOffset,
      required this.fronWheelHorizontalOffset,
      required this.dampingRatio,
      required this.maxMotorTorque,
      required this.bgColor,
      this.frequencyHz = 4});
}
