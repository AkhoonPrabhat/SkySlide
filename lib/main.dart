import '/assetlib/asset_lib.dart';
import '/constants/app_constants.dart';
import '/providers/app_provider.dart';
import '/services/db_service_instance.dart';
import '/view/selection_view.dart';
import '/widgets/loading_asset_widget.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

  await dbService.initDB();

  runApp(ChangeNotifierProvider(
    create: (context) => AppProvider(dbService: dbService, assetLib: assetLib),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: AppConstants.fontFamily),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: Scaffold(body: HomePage())),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AppProvider>(context);
    return Provider.of<AppProvider>(context).isLoadingAssets
        ? LoadingAssetWidget()
        : SelectionView();
  }
}
