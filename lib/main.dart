import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/bottom_nav_bar_provider.dart';
import 'package:movie_app_spark/providers/get_movies_provider.dart';
import 'package:provider/provider.dart';

import 'view/home/my_home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: BottomNavBarProvider(),
        ),
        ChangeNotifierProvider.value(
          value: GetMoviesProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the rot of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}
