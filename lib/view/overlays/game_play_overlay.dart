import '/assetlib/asset_constants.dart';
import '/constants/app_constants.dart';
import '/providers/app_provider.dart';
import '/providers/game_view_provider.dart';
import '/game/vehicle/vehicle.dart';
import '/view/overlays/hold_button.dart';
import '/widgets/icon_button_widget.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class GamePlayOverlay extends StatelessWidget {
  final Vehicle vehicle;
  final void Function()? onPauseMenuButtonPressed;
  final String fuelIconPath;
  const GamePlayOverlay(
      {super.key,
      required this.vehicle,
      required this.fuelIconPath,
      this.onPauseMenuButtonPressed});

  double getWidth(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return w < h ? w : h;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProgressWidget(
          fuelIconPath: fuelIconPath,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.padding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                HoldButton(
                  width: getWidth(context) / 2,
                  height: getWidth(context) / 3,
                  path: "brake.png",
                  onPressCallback: vehicle.revSpeed,
                  onReleaseCallback: vehicle.setSpeed,
                ),
                HoldButton(
                  width: getWidth(context) / 3,
                  height: getWidth(context) / 4,
                  path: "jump.png",
                  onPressCallback: () {
                    Provider.of<AppProvider>(context, listen: false)
                            .isAudioEnabled
                        ? FlameAudio.play(AssetConstants.jumpAudio)
                        : null;
                    vehicle.jump();
                  },
                  onReleaseCallback: null,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppConstants.padding),
          child: Align(
            alignment: Alignment.bottomRight,
            child: HoldButton(
              width: getWidth(context) / 2,
              height: getWidth(context) / 3,
              path: "speed.png",
              onPressCallback: vehicle.forSpeed,
              onReleaseCallback: vehicle.setSpeed,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.padding * 2),
            child: IconButtonWidget(
              iconData: FontAwesomeIcons.pause,
              onPressed: () {
                onPauseMenuButtonPressed != null
                    ? onPauseMenuButtonPressed!()
                    : null;
              },
            ),
          ),
        )
      ],
    );
  }
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key, required this.fuelIconPath});
  final String fuelIconPath;

  double getWidth(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return w < h ? w : h;
  }

  @override
  Widget build(BuildContext context) {
    final gameViewProvider = Provider.of<GameViewProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
          alignment: Alignment.topLeft,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconWidget(path: fuelIconPath),
                SizedBox(
                  width: 8.0,
                ),
                FuelLeftIndicator(),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const IconWidget(path: AssetConstants.coin),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  "${gameViewProvider.coinsCollected + gameViewProvider.storedCoins}",
                  style: AppConstants.mediumText,
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const IconWidget(
                  path: AssetConstants.trash,
                  width: 35,
                  height: 35,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                    " ${gameViewProvider.trashCollected + gameViewProvider.storedTrash}",
                    style: AppConstants.mediumText),
              ],
            ),
          ])),
    );
  }
}

class IconWidget extends StatelessWidget {
  final double width;
  final double height;
  final String path;

  const IconWidget(
      {super.key, this.width = 30, this.height = 30, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Image.asset(
          path,
          fit: BoxFit.contain,
        ));
  }
}

class FuelLeftIndicator extends StatelessWidget {
  const FuelLeftIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final gameViewProvider = Provider.of<GameViewProvider>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 2.0)),
          width: 90.0,
          height: 25.0,
          child: LinearProgressIndicator(
            value: gameViewProvider.fuelLeft / 100,
            backgroundColor: Colors.transparent,
            color: (gameViewProvider.fuelLeft / 100) < 0.2
                ? const Color(0xffeb2d3a)
                : const Color(0xff26c281),
            minHeight: 10.0,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            // padding: const EdgeInsets.all(8.0),
            child: gameViewProvider.getNextFuelDistance() != null
                ? Text(
                    "${(gameViewProvider.getNextFuelDistance()!.toInt())} m",
                    style: AppConstants.smallText,
                    textAlign: TextAlign.center,
                  )
                : SizedBox(),
          ),
        ),
      ],
    );
  }
}
