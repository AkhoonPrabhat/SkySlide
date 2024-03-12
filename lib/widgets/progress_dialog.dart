import '/constants/app_constants.dart';
import '/providers/app_provider.dart';
import '/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          height: height * 0.7,
          width: width * 0.4,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                // height: height * 0.65,
                width: width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      width * 0.03,
                    ),
                    color: AppConstants.overlayBgColor,
                    border: Border.all(color: Colors.white, width: 3)),
                padding: const EdgeInsets.all(AppConstants.padding * 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Progress', style: AppConstants.largeText),
                    const SizedBox(height: AppConstants.padding * 2),
                    Text(
                      "You have collected ${Provider.of<AppProvider>(context, listen: false).storedTrash.toString()} pounds of trash so far.",
                      style: AppConstants.mediumText,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: AppConstants.padding * 2,
                    ),
                    Text(
                      "time to make it real!",
                      style: AppConstants.largeDisplayText,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppConstants.padding),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButtonWidget(
                    iconData: FontAwesomeIcons.x,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
