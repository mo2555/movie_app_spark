import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_spark/providers/watchlist_provider.dart';
import 'package:provider/provider.dart';

import '../../shared/list_view_item.dart';

class WatchlistListViewWidget extends StatelessWidget {
  const WatchlistListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<WatchlistProvider>(builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 5,
            right: 5,
          ),
          child: provider.watchlistData.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (ctx, index) => ListViewItem(
                    imageUrl: provider.watchlistData[index].posterPath == null
                        ? 'https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg'
                        : 'http://image.tmdb.org/t/p/w500/${provider.watchlistData[index].posterPath}',
                    title: provider.watchlistData[index].title ?? '',
                    description: provider.watchlistData[index].overview ?? '',
                    check: true,
                  ),
                  separatorBuilder: (ctx, index) => const Divider(
                    color: Colors.grey,
                    thickness: 0.7,
                  ),
                  itemCount: provider.watchlistData.length,
                )
              : Center(
                  child: Lottie.asset('assets/images/nno_data_lottie.json'),
                ),
        );
      }),
    );
  }
}
