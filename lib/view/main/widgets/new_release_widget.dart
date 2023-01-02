import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/get_movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[700]!,
                      highlightColor: Colors.grey[600]!,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Container(
                            height: 100,
                            width: 80,
                            color: Colors.white,
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return const SizedBox(
                            width: 12,
                          );
                        },
                        itemCount: 8,
                      ),
                    )
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              width: 70,
                              height: 1000,
                              placeholder: 'assets/images/ronaldo.png',
                              image: provider.popularDataModel[index].posterPath == null
                                  ? 'https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg'
                                  : 'http://image.tmdb.org/t/p/w500/${provider.popularDataModel[index].posterPath}',
                              imageErrorBuilder: (c, v, b) => Image.asset(
                                'assets/images/ronaldo.png',
                                fit: BoxFit.cover,
                                width: 70,
                                height: 1000,
                              ),
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
