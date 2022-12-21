import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/get_movies_provider.dart';
import 'package:movie_app_spark/view/main/widgets/recommended_movie_widget.dart';
import 'package:provider/provider.dart';

import 'widgets/new_release_widget.dart';
import 'widgets/top_movie_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      Provider.of<GetMoviesProvider>(context, listen: false).getLatest();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopMovieWidget(),
        Container(
          height: 15,
          color: Colors.black,
        ),
        NewReleaseWidget(),
        Container(
          height: 15,
          color: Colors.black,
        ),
        RecommendedMovieWidget(),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
