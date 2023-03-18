import 'package:flutter/cupertino.dart';

import '../pages/home/home_screen.dart';
import '../utils/Binding/HomeBinding.dart';
import 'package:get/get.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}