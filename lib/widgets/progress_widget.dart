import '/constants/app_constants.dart';
import '/widgets/progress_dialog.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final String text;
  final String iconPath;
  const ProgressWidget({super.key, required this.text, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const ProgressDialog();
          },
        );
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(right: AppConstants.padding * 1.5),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 11, 52, 100),
                borderRadius: BorderRadius.all(
                    Radius.circular(AppConstants.padding * 2))),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: width * 0.02,
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.padding / 4),
                      child: Image.asset(
                        iconPath,
                      ),
                    )),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  text,
                  style: AppConstants.smallText,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
