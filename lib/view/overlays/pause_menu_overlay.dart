import '/constants/app_constants.dart';
import '/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PauseMenuOverlay extends StatelessWidget {
  final double height;
  final double width;
  final void Function()? onResumeCallback;
  final void Function()? onRestartCallback;
  final void Function()? onExitCallback;
  final void Function()? onCancelCallback;

  const PauseMenuOverlay(
      {super.key,
      this.height = 100.0,
      this.width = 80.0,
      this.onCancelCallback,
      this.onExitCallback,
      this.onRestartCallback,
      this.onResumeCallback});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: height * 0.65,
        width: width * 0.3,
        child: Stack(
          children: [
            Positioned(
              top: height * 0.02,
              child: Container(
                padding: EdgeInsets.all(width * 0.009),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 242, 243, 247),
                    borderRadius: BorderRadius.circular(
                      width * 0.03,
                    )),
                height: height * 0.63,
                width: width * 0.29,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppConstants.overlayBgColor,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MenuButtonWidget(
                          label: 'resume',
                          height: height,
                          width: width,
                          onPressed: onResumeCallback,
                        ),
                        MenuButtonWidget(
                          label: 'restart',
                          height: height,
                          width: width,
                          onPressed: onRestartCallback,
                        ),
                        MenuButtonWidget(
                          label: 'exit',
                          height: height,
                          width: width,
                          onPressed: onExitCallback,
                        ),
                      ]),
                ),
              ),
            ),
            Positioned(
                right: 0,
                child: IconButtonWidget(
                  iconData: FontAwesomeIcons.x,
                  onPressed: onCancelCallback,
                ))
          ],
        ),
      ),
    );
  }
}

class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget(
      {super.key,
      required this.label,
      required this.width,
      required this.height,
      this.onPressed,
      this.color = AppConstants.iconButtonWidgetColor});
  final double height;
  final double width;
  final String label;
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height * 0.1,
        width: width * 0.17,
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: AppConstants.iconButtonWidgetColor),
          onPressed: () {
            onPressed != null ? onPressed!() : null;
          },
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
                fontSize: width * 0.025,
                color: Color.fromARGB(221, 29, 29, 29)),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
