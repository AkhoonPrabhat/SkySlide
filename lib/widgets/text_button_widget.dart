import '/constants/app_constants.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color backgroundColor;
  final Color color;
  final void Function()? onPressed;

  const TextButtonWidget(
      {super.key,
      required this.imagePath,
      required this.text,
      this.backgroundColor = const Color.fromARGB(255, 248, 248, 248),
      this.color = Colors.black87,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(AppConstants.padding),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: width / 4,
            child: TextButton(
                style: TextButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: backgroundColor,
                    shape: const RoundedRectangleBorder()),
                onPressed: () {
                  debugPrint("Pressed $text");
                  onPressed != null ? onPressed!() : null;
                },
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.padding * 0.8),
                  child: Text(
                    text,
                    style: AppConstants.mediumText.copyWith(color: color),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
