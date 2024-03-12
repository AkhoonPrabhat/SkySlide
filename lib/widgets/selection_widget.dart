import '/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectionWidget extends StatelessWidget {
  final String imagePath;
  final String label;
  final String? score;
  final Color color;

  const SelectionWidget({
    super.key,
    required this.imagePath,
    required this.label,
    required this.color,
    this.score,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.6,
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 255, 255, 255), width: 5),
          image: DecorationImage(
              image: AssetImage(imagePath), fit: BoxFit.contain)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(AppConstants.padding),
            decoration: BoxDecoration(color: color),
            child: Text(
              label,
              style: AppConstants.mediumText,
              textAlign: TextAlign.center,
            ),
          ),
          score != null
              ? Container(
                  padding: const EdgeInsets.all(AppConstants.padding),
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: color.withAlpha(125)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.crown,
                        size: height * 0.07,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: AppConstants.padding,
                      ),
                      Text(
                        score!,
                        style: AppConstants.mediumText,
                      ),
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
