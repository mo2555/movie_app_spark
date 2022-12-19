import 'package:flutter/material.dart';
import 'package:movie_app_spark/view/movie_overview/widges/movie_overview_top_widget.dart';

import 'widges/movie_details_widget.dart';

class MovieOverviewScreen extends StatelessWidget {
  const MovieOverviewScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131213),
      appBar: AppBar(
        backgroundColor: const Color(0xFF131213),
        title: Text(title),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieOverviewTopWidget(
            title: title,
          ),
          MovieDetailsWidget(),
        ],
      ),
    );
  }
}
