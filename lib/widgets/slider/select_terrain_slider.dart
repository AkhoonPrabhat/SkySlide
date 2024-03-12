import '/constants/app_constants.dart';
import '/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../selection_widget.dart';

class SelectTerrainSlider extends StatelessWidget {
  SelectTerrainSlider({super.key});
  final _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        initialPage: 0,
        autoPlay: false,
        height: height * 0.46,
        pauseAutoPlayOnTouch: true,
        enableInfiniteScroll: false,
        viewportFraction: 0.35,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayInterval: const Duration(seconds: 2),
        enlargeCenterPage: true,
        aspectRatio: 5.0,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {
          Provider.of<AppProvider>(context, listen: false)
              .changeSelectedTerrainIndex(index);
        },
      ),
      items: Provider.of<AppProvider>(context, listen: true)
          .assetLib
          .terrainInfoArr
          .map((terrainInfo) {
        return GestureDetector(
          onTap: () {
            Provider.of<AppProvider>(context, listen: false)
                .changeSelectedTerrainIndex(terrainInfo.id);
            _carouselController.animateToPage(terrainInfo.id);
          },
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.padding / 2),
            child: SelectionWidget(
                imagePath:
                    "assets/images/fuelIcons/${terrainInfo.name.toLowerCase()}.png",
                label: terrainInfo.name,
                score: terrainInfo.maxDistanceTravelled.toString(),
                color: terrainInfo.bgColor),
          ),
        );
      }).toList(),
    );
  }
}
