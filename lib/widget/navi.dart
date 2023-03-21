import 'package:flutter/cupertino.dart';
import 'package:flutterbook/cubit/counter.dart';

import '../pages/home/home_screen.dart';
import '../utils/Binding/HomeBinding.dart';
import 'package:get/get.dart';
GlobalKey<FormState> _homeKey = GlobalKey<FormState>(debugLabel: '_homeScreener22');

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: _homeKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(name: '/2', page: () => countert()),

      ],
    );
  }
}