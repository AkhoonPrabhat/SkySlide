import '/constants/app_constants.dart';
import 'package:flutter/material.dart';

class HoldButton extends StatelessWidget {
  HoldButton(
      {super.key,
      required this.path,
      this.onPressCallback,
      this.onReleaseCallback,
      required this.width,
      required this.height});
  final String path;
  final ValueNotifier<bool> _isPressed = ValueNotifier(false);
  final void Function()? onPressCallback;
  final void Function()? onReleaseCallback;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _isPressed.value = true;
        onPressCallback != null ? onPressCallback!() : null;
      },
      onTapUp: (_) {
        _isPressed.value = false;
        onReleaseCallback != null ? onReleaseCallback!() : null;
      },
      child: ValueListenableBuilder(
          valueListenable: _isPressed,
          builder: (context, value, widget) {
            return Container(
              padding: const EdgeInsets.all(AppConstants.padding),
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/$path"),
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(value ? 1.0 : 0.7),
                        BlendMode.modulate)),
              ),
            );
          }),
    );
  }
}
