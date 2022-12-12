import 'package:flutter/material.dart';
import 'package:movie_app_spark/view/browses/widgets/browses_grid_view_widget.dart';

class BrowsesScreen extends StatelessWidget {
  const BrowsesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(
        top: 80,
        right: 12,
        left: 12,
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'BROWSES CATEGORY',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          BrowsesGridViewWidget(),
        ],
      ),
    );
  }
}
