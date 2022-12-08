import 'package:flutter/material.dart';
import 'package:movie_app_spark/helper/cache_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    CacheHelper.setData(
      key: 'home',
      value: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/movie.png',
            ),
          ),
        ),
        child: Text(
          'Action',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
