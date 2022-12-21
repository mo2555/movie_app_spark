import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/get_movies_provider.dart';
import 'package:movie_app_spark/view/movie_overview/movie_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TopMovieWidget extends StatelessWidget {
  const TopMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetMoviesProvider>(builder: (context, provider, _) {
      return provider.loading || provider.movieDataModelLatest == null
          ? Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                color: Colors.white,
                height: 250,
                width: double.infinity,
              ),
            )
          : SizedBox(
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
                        image:
                            'http://image.tmdb.org/t/p/w500/${provider.movieDataModelLatest!.posterPath ?? ''}',
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                provider.movieDataModelLatest!.title ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                provider.movieDataModelLatest!.overview??
                                    '',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
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
                                  builder: (ctx) => const MovieOverviewScreen(
                                    imageUrl: 'assets/images/ronaldo.png',
                                    title: 'title',
                                    time: 'time',
                                  ),
                                ),
                              );
                            },
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              height: 180,
                              width: 120,
                              placeholder: 'assets/images/ronaldo.png',
                              image:
                                  'http://image.tmdb.org/t/p/w500/${provider.movieDataModelLatest!.posterPath ?? ''}',
                              imageErrorBuilder: (c, v, b) => Image.asset(
                                'assets/images/ronaldo.png',
                                fit: BoxFit.cover,
                                height: 180,
                                width: 120,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.grey,
                            height: 40,
                            width: 25,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
