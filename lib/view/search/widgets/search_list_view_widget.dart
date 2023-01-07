import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_spark/providers/search_data_provider.dart';
import 'package:movie_app_spark/view/shared/list_view_item.dart';
import 'package:provider/provider.dart';

class SearchListViewWidget extends StatelessWidget {
  const SearchListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchDataProvider>(builder: (context, provider, _) {
      return Expanded(
        child: provider.searchDataLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : provider.searchDataModel.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (ctx, index) => ListViewItem(
                      imageUrl: provider.searchDataModel[index].posterPath ==
                              null
                          ? 'https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg'
                          : 'http://image.tmdb.org/t/p/w500/${provider.searchDataModel[index].posterPath}',
                      title: provider.searchDataModel[index].title ?? '',
                      description:
                          provider.searchDataModel[index].overview ?? '',
                      check: false,
                    ),
                    separatorBuilder: (ctx, index) => const Divider(
                      color: Colors.grey,
                      thickness: 0.7,
                    ),
                    itemCount: provider.searchDataModel.length,
                  )
                : Center(
                    child: Lottie.asset(
                      'assets/images/nno_data_lottie.json',
                    ),
                  ),
      );
    });
  }
}
