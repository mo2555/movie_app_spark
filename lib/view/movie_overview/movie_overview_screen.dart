import 'package:flutter/material.dart';
import 'package:movie_app_spark/view/movie_overview/widges/movie_details_widget.dart';
import 'package:movie_app_spark/view/movie_overview/widges/movie_overview_top_widget.dart';

class MovieOverviewScreen extends StatelessWidget {
  const MovieOverviewScreen({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.description,
    required this.genresId,
    required this.rate,
    required this.movieId,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String time;
  final String description;
  final List<dynamic> genresId;
  final double rate;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black87,
        title: Text(
          title,
        ),
      ),
      body: ListView(
        children: [
          MovieOverviewTopWidget(
            imageUrl: imageUrl,
            title: title,
            time: time,
          ),
          MovieDetailsWidget(
            imageUrl: imageUrl,
            description: description,
            rate: rate,
            genres: genresId,
          ),
        ],
      ),
    );
  }
}
