import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/bottom_nav_bar_provider.dart';
import 'package:movie_app_spark/providers/get_movies_provider.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      Provider.of<GetMoviesProvider>(context, listen: false).getLatest();
      Provider.of<GetMoviesProvider>(context, listen: false).getPopular();
    });

    /*

     */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: provider.screens[provider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: provider.bottomNavBarItemList,
          currentIndex: provider.currentIndex,
          onTap: (int index) {
            provider.changeCurrentIndex(index: index);
          },
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          backgroundColor: Colors.black87,
        ),
      );
    });
  }
}
