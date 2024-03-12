import '/constants/app_constants.dart';
import '/providers/app_provider.dart';
import '/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SettingDialog extends StatelessWidget {
  const SettingDialog({super.key});
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
                height: height * 0.65,
                width: width * 0.3,
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
                    const Text('Settings', style: AppConstants.largeText),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Audio',
                          style: AppConstants.smallText,
                        ),
                        Switch(
                          activeTrackColor: AppConstants.iconButtonWidgetColor
                              .withOpacity(0.8),
                          activeColor: Colors.white,
                          trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                          value: Provider.of<AppProvider>(
                            context,
                          ).isAudioEnabled,
                          onChanged: (bool value) {
                            if (value) {
                              Provider.of<AppProvider>(context, listen: false)
                                  .enableAudio();
                            } else {
                              Provider.of<AppProvider>(context, listen: false)
                                  .disableAudio();
                            }
                          },
                        ),
                      ],
                    ),
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
