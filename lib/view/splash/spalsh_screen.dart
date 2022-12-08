import 'package:flutter/material.dart';
import 'package:movie_app_spark/view/main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const MainScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/movie.png'),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Colors.orangeAccent,
            )
          ],
        ),
      ),
    );
  }
}
