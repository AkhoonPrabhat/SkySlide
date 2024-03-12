import '/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;
  const IconButtonWidget({super.key, required this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        onPressed != null ? onPressed!() : null;
      },
      child: Container(
        padding: const EdgeInsets.all(AppConstants.padding),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.0),
            shape: BoxShape.circle,
            color: Colors.amber[500]?.withOpacity(0.85)),
        child: FaIcon(
          iconData,
          color: Colors.white,
          size: width * 0.038,
        ),
      ),
    );
  }
}
