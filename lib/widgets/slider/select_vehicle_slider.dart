import '/constants/app_constants.dart';
import '/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../selection_widget.dart';

class SelectVehicleSlider extends StatelessWidget {
  SelectVehicleSlider({super.key});
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
              .changeSelectedVehicleIndex(index);
        },
      ),
      items: Provider.of<AppProvider>(context, listen: false)
          .assetLib
          .vehicleInfoArr
          .map((vehicle) {
        return GestureDetector(
          onTap: () {
            Provider.of<AppProvider>(context, listen: false)
                .changeSelectedVehicleIndex(vehicle.id);
            _carouselController.animateToPage(vehicle.id);
          },
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.padding),
            child: SelectionWidget(
                imagePath: "assets/images/vehiclebg/${vehicle.vehicleName}.png",
                label: vehicle.vehicleName,
                score: null,
                color: vehicle.bgColor),
          ),
        );
      }).toList(),
    );
  }
}
