import '/providers/app_provider.dart';
import '/view/game_view.dart';
import '/widgets/option_info_arr..dart';
import '/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionsTab extends StatelessWidget {
  const OptionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ...optionsInfoArr.map((option) => TextButtonWidget(
            imagePath: option.imagePath,
            text: option.label,
            color: Provider.of<AppProvider>(
                      context,
                    ).selectedOptionIndex ==
                    option.id
                ? Colors.white
                : Colors.black87,
            backgroundColor: Provider.of<AppProvider>(
                      context,
                    ).selectedOptionIndex !=
                    option.id
                ? Colors.white
                : Colors.black87,
            onPressed: () {
              Provider.of<AppProvider>(context, listen: false)
                  .changeSelectedOption(option.id);
            },
          )),
      TextButtonWidget(
        imagePath: "assets/images/start.png",
        text: "START",
        backgroundColor: Colors.yellow,
        onPressed: () async {
          final val = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                        body: GameView(
                          dbService:
                              Provider.of<AppProvider>(context, listen: false)
                                  .dbService,
                          storedCoins:
                              Provider.of<AppProvider>(context, listen: false)
                                      .storedCoins ??
                                  0,
                          storedTrash:
                              Provider.of<AppProvider>(context, listen: false)
                                      .storedTrash ??
                                  0,
                          vehicleInfo:
                              Provider.of<AppProvider>(context, listen: false)
                                  .getSelectedVehicle(),
                          terrainInfo:
                              Provider.of<AppProvider>(context, listen: false)
                                  .getSelectedTerrain(),
                        ),
                      )));
          await Provider.of<AppProvider>(context, listen: false).getProgress();
        },
      ),
    ]);
  }
}
