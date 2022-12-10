import 'package:flutter/material.dart';
import 'package:movie_app_spark/view/search/widgets/search_list_widget.dart';
import 'package:movie_app_spark/view/watchlist/widget/watchlist_widget.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(
            height: 60,
          ),
          Text(
            'Watchlist ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          WatchlistWidget()
        ],
      ),
    );
  }
}
