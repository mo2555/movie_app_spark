import 'package:flutter/material.dart';
import 'package:movie_app_spark/helper/cache_helper.dart';
import 'package:movie_app_spark/view/main/main_screen.dart';
import 'package:movie_app_spark/view/splash/spalsh_screen.dart';
import 'package:provider/provider.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  var check = await CacheHelper.getData(key: 'home');

  print(check);

  runApp(
      MyApp(
      check: check,),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.check});

  final bool check;

  // This widget is the rot of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: check==true?MainScreen():SplashScreen()
    );
  }
}
