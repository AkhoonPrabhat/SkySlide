import '/widgets/settings_dialog.dart';
import '/assetlib/asset_constants.dart';
import '/constants/app_constants.dart';
import '/providers/app_provider.dart';
import '/widgets/option_info_arr..dart';
import '/widgets/options_tab.dart';
import '/widgets/icon_button_widget.dart';
import '/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SelectionView extends StatelessWidget {
  SelectionView({super.key}) {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            color: AppConstants.overlayBgColor,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      AppConstants.padding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProgressWidget(
                            text:
                                Provider.of<AppProvider>(context).storedCoins ==
                                        null
                                    ? "?"
                                    : Provider.of<AppProvider>(context)
                                        .storedCoins!
                                        .toString(),
                            iconPath: AssetConstants.coin),
                        const SizedBox(
                          width: AppConstants.padding,
                        ),
                        ProgressWidget(
                            text:
                                Provider.of<AppProvider>(context).storedTrash ==
                                        null
                                    ? "?"
                                    : Provider.of<AppProvider>(context)
                                        .storedTrash!
                                        .toString(),
                            iconPath: AssetConstants.trash)
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(AppConstants.padding),
                    margin: EdgeInsets.only(right: width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.02,
                        ),
                        IconButtonWidget(
                          iconData: FontAwesomeIcons.gear,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SettingDialog();
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppConstants.padding * 3,
              ),
              optionsInfoArr[
                      Provider.of<AppProvider>(context).selectedOptionIndex]
                  .widget,
              const SizedBox(
                height: AppConstants.padding * 3,
              ),
              const OptionsTab()
            ],
          ),
        ),
      ),
    );
  }
}
