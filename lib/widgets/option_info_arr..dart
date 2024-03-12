import '/assetlib/asset_constants.dart';
import '/widgets/slider/select_terrain_slider.dart';
import '/widgets/slider/select_vehicle_slider.dart';
import 'package:flutter/material.dart';

class OptionInfo {
  final int id;
  final String imagePath;
  final String label;
  final Widget widget;

  OptionInfo(
      {required this.id,
      required this.imagePath,
      required this.label,
      required this.widget});
}

final List<OptionInfo> optionsInfoArr = [
  OptionInfo(
      id: 0,
      imagePath: AssetConstants.terrain,
      label: "TERRAIN",
      widget: SelectTerrainSlider()),
  OptionInfo(
      id: 1,
      imagePath: AssetConstants.vehicle,
      label: "VEHICLE",
      widget: SelectVehicleSlider()),
];
