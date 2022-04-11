import 'package:flutter/material.dart';
import 'package:search_view_demo/Constant/Constant.dart';
import 'package:search_view_demo/Screens/HomeScreen.dart';
import 'package:search_view_demo/Screens/SplashScreen.dart';

main() {
  runApp(MaterialApp(
    title: 'FluterBottemNavigationView',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        indicatorColor: Colors.grey,
        highlightColor: Colors.grey,
        bottomAppBarColor: Colors.black,
        primaryColor: const Color(0xFFffffff),
        primaryColorDark: const Color(0x00ffffff),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
    home: const SplashScreen(),
    routes: <String, WidgetBuilder>{
      homeScreen: (BuildContext context) => const HomeScreen(),
      animatedSplash: (BuildContext context) => const SplashScreen(),
    },
  ));
}
