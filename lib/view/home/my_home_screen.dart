import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/api_provider.dart';
import 'package:movie_app_spark/providers/bottom_nav_bar_provider.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Provider.of<APIProvider>(context, listen: false).searchMovie(q: 'max');
          },
        ),
      );
    });
  }
}
