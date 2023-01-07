import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/get_movies_provider.dart';
import 'package:provider/provider.dart';

class BrowsesGridViewWidget extends StatelessWidget {
  const BrowsesGridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<GetMoviesProvider>(builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 5,
            right: 5,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 50,
              crossAxisSpacing: 35,
              childAspectRatio: 3.5 / 2,
            ),
            itemBuilder: (ctx, index) => Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/ronaldo.png',
                  ),
                ),
              ),
              child: Text(
                provider.genreDataModel[index].name ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            itemCount: provider.genreDataModel.length,
          ),
        );
      }),
    );
  }
}
