import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/get_movies_provider.dart';
import 'package:movie_app_spark/providers/watchlist_provider.dart';
import 'package:movie_app_spark/view/movie_overview/movie_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TopMovieWidget extends StatelessWidget {
  const TopMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetMoviesProvider>(builder: (context, provider, _) {
      return provider.getLatestLoading
          ? Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                color: Colors.white,
                height: 250,
                width: double.infinity,
              ),
            )
          : provider.latestDataModel != null
              ? SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          FadeInImage.assetNetwork(
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/ronaldo.png',
                            image: provider.latestDataModel!.posterPath == null
                                ? 'https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg'
                                : 'http://image.tmdb.org/t/p/w500/${provider.latestDataModel!.posterPath}',
                            imageErrorBuilder: (c, v, b) => Image.asset(
                              'assets/images/ronaldo.png',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.black,
                              padding: const EdgeInsets.only(
                                left: 150.0,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    provider.latestDataModel!.title ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    provider.latestDataModel!.overview ?? '',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: 50,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 20,
                        child: SizedBox(
                          width: 120,
                          height: 180,
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) => MovieOverviewScreen(
                                        imageUrl: provider.latestDataModel!
                                                    .posterPath ==
                                                null
                                            ? 'https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg'
                                            : 'http://image.tmdb.org/t/p/w500/${provider.latestDataModel!.posterPath}',
                                        title:
                                            provider.latestDataModel!.title ??
                                                '',
                                        time: provider
                                                .latestDataModel!.releaseDate ??
                                            '',
                                        description: provider
                                                .latestDataModel!.overview ??
                                            '',
                                        rate: provider
                                                .latestDataModel!.voteAverage ??
                                            0.0,
                                        genresId: provider
                                                .latestDataModel!.genreIds ??
                                            [],
                                        movieId:
                                            provider.latestDataModel!.id ?? 0,
                                      ),
                                    ),
                                  );
                                },
                                child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  height: 180,
                                  width: 120,
                                  placeholder: 'assets/images/ronaldo.png',
                                  image: provider.latestDataModel!.posterPath ==
                                          null
                                      ? 'https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg'
                                      : 'http://image.tmdb.org/t/p/w500/${provider.latestDataModel!.posterPath}',
                                  imageErrorBuilder: (c, v, b) => Image.asset(
                                    'assets/images/ronaldo.png',
                                    fit: BoxFit.cover,
                                    height: 180,
                                    width: 120,
                                  ),
                                ),
                              ),
                              Consumer<WatchlistProvider>(
                                  builder: (context, provider, _) {
                                return GestureDetector(
                                  onTap: () {
                                    provider.addOrRemoveData(
                                        model: context
                                            .read<GetMoviesProvider>()
                                            .latestDataModel);
                                  },
                                  child: Container(
                                    color: provider.watchlistData.contains(
                                            context
                                                .read<GetMoviesProvider>()
                                                .latestDataModel)
                                        ? Colors.deepOrange
                                        : Colors.grey,
                                    height: 40,
                                    width: 25,
                                    child: Icon(
                                      provider.watchlistData.contains(context
                                              .read<GetMoviesProvider>()
                                              .latestDataModel)
                                          ? Icons.check
                                          : Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/no_data.png",
                    fit: BoxFit.fill,
                  ),
                );
    });
  }
}
