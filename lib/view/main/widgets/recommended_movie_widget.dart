import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_spark/providers/get_movies_provider.dart';
import 'package:provider/provider.dart';

import '../../movie_overview/movie_overview_screen.dart';
import '../../shimmer/shimmer_list_view.dart';

class RecommendedMovieWidget extends StatelessWidget {
  const RecommendedMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetMoviesProvider>(builder: (context, provider, _) {
      return Container(
        padding: const EdgeInsets.only(
          left: 15,
          bottom: 8,
        ),
        height: 180,
        color: Colors.black87.withOpacity(0.75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                'Recommended',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: provider.getTopRatedLoading
                  ? const ShimmerListView(
                      width: 100,
                      height: 120,
                    )
                  : provider.topRatedDataModel.isEmpty
                      ? SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: Lottie.asset(
                            'assets/images/nno_data_lottie.json',
                          ),
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
                                      imageUrl: provider
                                                  .topRatedDataModel[index]
                                                  .posterPath ==
                                              null
                                          ? 'https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg'
                                          : 'http://image.tmdb.org/t/p/w500/${provider.topRatedDataModel[index].posterPath}',
                                      title: provider
                                              .topRatedDataModel[index].title ??
                                          '',
                                      time: provider.topRatedDataModel[index]
                                              .releaseDate ??
                                          '',
                                      description: provider
                                              .topRatedDataModel[index]
                                              .overview ??
                                          '',
                                      rate: provider.topRatedDataModel[index]
                                              .voteAverage ??
                                          0.0,
                                      genresId: provider
                                              .topRatedDataModel[index]
                                              .genreIds ??
                                          [],
                                      movieId: provider
                                              .topRatedDataModel[index].id ??
                                          0,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 10,
                                color: Colors.grey.shade700,
                                child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Column(
                                      children: [
                                        FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                          placeholder:
                                              'assets/images/ronaldo.png',
                                          image: provider
                                                      .topRatedDataModel[index]
                                                      .posterPath ==
                                                  null
                                              ? 'https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg'
                                              : 'http://image.tmdb.org/t/p/w500/${provider.topRatedDataModel[index].posterPath}',
                                          imageErrorBuilder: (c, v, b) =>
                                              Image.asset(
                                            'assets/images/ronaldo.png',
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 100,
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.deepOrange,
                                                    size: 10,
                                                  ),
                                                  Text(
                                                    '${provider.topRatedDataModel[index].voteAverage}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 8),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                provider
                                                        .topRatedDataModel[
                                                            index]
                                                        .title ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                                maxLines: 1,
                                              ),
                                              Text(
                                                provider
                                                        .topRatedDataModel[
                                                            index]
                                                        .releaseDate ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      color: Colors.grey,
                                      height: 25,
                                      width: 20,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return const SizedBox(
                              width: 12,
                            );
                          },
                          itemCount: provider.topRatedDataModel.length,
                        ),
            ),
          ],
        ),
      );
    });
  }
}
