import 'package:flutter/material.dart';
import 'package:movie_app_spark/view/watchlist/widgets/watchlist_list_view_widget.dart';

import '../shared/list_view_item.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

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
            'WATCHLIST',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          WatchlistListViewWidget(),
        ],
      ),
    );
  }
}
