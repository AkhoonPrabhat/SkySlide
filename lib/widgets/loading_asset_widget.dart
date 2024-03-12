import '/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadingAssetWidget extends StatelessWidget {
  const LoadingAssetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return SafeArea(
        child: Scaffold(
            body: Container(
      color: Colors.lightBlue,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Skyslide",
                textAlign: TextAlign.center,
                style: AppConstants.largeDisplayText.copyWith(fontSize: 60.0)),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Image.asset("assets/images/loading.gif",
                    fit: BoxFit.contain)),
            Text(
              "Loading...",
              style: AppConstants.largeText,
            ),
          ],
        ),
      ),
    )));
  }
}
