import 'package:flutter/material.dart';
import 'package:movie_app_spark/view/main/widgets/recommended_movie_widget.dart';

import 'widgets/new_release_widget.dart';
import 'widgets/top_movie_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
