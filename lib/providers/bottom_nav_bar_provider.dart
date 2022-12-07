import 'package:flutter/material.dart';
import 'package:movie_app_spark/view/browses/broswes_screen.dart';
import 'package:movie_app_spark/view/main/main_screen.dart';
import 'package:movie_app_spark/view/search/search_screen.dart';
import 'package:movie_app_spark/view/watchlist/watchlist_screen.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  changeCurrentIndex({required int index}) {
    currentIndex = index;
    notifyListeners();
  }

  List<BottomNavigationBarItem> bottomNavBarItemList = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'HOME'),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.search_rounded,
      ),
      label: 'SEARCH',
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.movie,
        ),
        label: 'BROWSES'),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.book,
      ),
      label: 'WATCHLIST',
    ),
  ];

  List<Widget> screens = [
    MainScreen(),
    SearchScreen(),
    BrowsesScreen(),
    WatchlistScreen(),
  ];
}
