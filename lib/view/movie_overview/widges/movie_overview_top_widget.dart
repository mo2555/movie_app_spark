import 'package:flutter/material.dart';

import '../../../utils/app_themes/app_themes.dart';

class MovieOverviewTopWidget extends StatelessWidget {
  const MovieOverviewTopWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.time,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageUrl,
              ),
            ),
          ),
          child: const Icon(
            Icons.play_circle,
            color: Colors.white,
            size: 55,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppThemes.textStyle1,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
