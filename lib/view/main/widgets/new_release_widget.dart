import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/get_movies_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/watchlist_provider.dart';
import '../../movie_overview/movie_overview_screen.dart';
import '../../shimmer/shimmer_list_view.dart';

class NewReleaseWidget extends StatelessWidget {
  const NewReleaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetMoviesProvider>(builder: (context, provider, _) {
      return Container(
        padding: const EdgeInsets.only(
          left: 15,
          bottom: 8,
        ),
        height: 120,
        color: Colors.black87.withOpacity(0.75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                'New Release',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: provider.popularDataModel.isEmpty
                  ? const ShimmerListView(
                      width: 80,
                      height: 100,
                    )
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => MovieOverviewScreen(
                                  imageUrl: provider.popularDataModel[index]
                                              .posterPath ==
                                          null
                                      ? 'https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg'
                                      : 'http://image.tmdb.org/t/p/w500/${provider.popularDataModel[index].posterPath}',
                                  title:
                                      provider.popularDataModel[index].title ??
                                          '',
                                  time: provider.popularDataModel[index]
                                          .releaseDate ??
                                      '',
                                  description: provider
                                          .popularDataModel[index].overview ??
                                      '',
                                  rate: provider.popularDataModel[index]
                                          .voteAverage ??
                                      0.0,
                                  genresId: provider
                                          .popularDataModel[index].genreIds ??
                                      [],
                                  movieId:
                                      provider.popularDataModel[index].id ?? 0,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                width: 70,
                                height: 1000,
                                placeholder: 'assets/images/ronaldo.png',
                                image: provider.popularDataModel[index]
                                            .posterPath ==
                                        null
                                    ? 'https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg'
                                    : 'http://image.tmdb.org/t/p/w500/${provider.popularDataModel[index].posterPath}',
                                imageErrorBuilder: (c, v, b) => Image.asset(
                                  'assets/images/ronaldo.png',
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: 1000,
                                ),
                              ),
                              Consumer<WatchlistProvider>(
                                  builder: (context, provider, _) {
                                    return GestureDetector(
                                      onTap: () {
                                        provider.addOrRemoveData(
                                            model: context
                                                .read<GetMoviesProvider>()
                                                .popularDataModel[index]);
                                      },
                                      child: Container(
                                        color: provider.watchlistData.contains(
                                            context
                                                .read<GetMoviesProvider>()
                                                .popularDataModel[index])
                                            ? Colors.deepOrange
                                            : Colors.grey,
                                        height: 25,
                                        width: 20,
                                        child: Icon(
                                          provider.watchlistData.contains(context
                                              .read<GetMoviesProvider>()
                                              .popularDataModel[index])
                                              ? Icons.check
                                              : Icons.add,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          width: 12,
                        );
                      },
                      itemCount: provider.popularDataModel.length,
                    ),
            ),
          ],
        ),
      );
    });
  }
}
