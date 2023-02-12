import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unscript/constant/theme.dart';
import 'package:unscript/service/initialize_controller.dart';
import 'package:unscript/utils/routes.dart';

void main() async {
  await GetStorage.init();
  InitializeController.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "LENDEN - BOND TRADE SIMPLIFIED",
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: "/splash",
      getPages: routesList,
    );
  }
}
