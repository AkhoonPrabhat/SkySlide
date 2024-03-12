import '/assetlib/asset_constants.dart';
import '/constants/app_constants.dart';
import '/providers/game_view_provider.dart';
import '/view/overlays/game_play_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class GameEndOverlay extends StatelessWidget {
  final void Function()? onTapCallback;
  const GameEndOverlay({super.key, this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    final gameViewProvider =
        Provider.of<GameViewProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final style = TextStyle(
        fontSize: height * width / 12000, color: const Color(0xffffffff));
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("GAME OVER", style: AppConstants.largeDisplayText),
              const SizedBox(
                height: AppConstants.padding * 2,
              ),
              Text("DISTANCE ${gameViewProvider.distanceTravelled}",
                  style: AppConstants.largeText),
              const SizedBox(
                height: AppConstants.padding,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const IconWidget(path: AssetConstants.coin),
                  const SizedBox(
                    width: AppConstants.padding,
                  ),
                  Text("+ ${gameViewProvider.coinsCollected} COINS",
                      style: AppConstants.largeText),
                ],
              ),
              const SizedBox(
                height: AppConstants.padding,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const IconWidget(
                    path: AssetConstants.trash,
                    width: 40.0,
                    height: 40.0,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text("+ ${gameViewProvider.trashCollected} TRASH",
                      style: AppConstants.largeText),
                ],
              ),
              const SizedBox(
                height: AppConstants.padding * 3,
              ),
              GestureDetector(
                  onTap: () {
                    onTapCallback != null ? onTapCallback!() : null;
                  },
                  child: Text("TAP TO CONTINUE",
                      style: AppConstants.largeDisplayText)),
            ],
          ),
        ],
      ),
    );
  }
}
