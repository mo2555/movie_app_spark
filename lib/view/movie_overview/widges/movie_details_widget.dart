import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/get_movies_provider.dart';
import 'package:movie_app_spark/utils/app_themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_constants/app_constants.dart';

class MovieDetailsWidget extends StatefulWidget {
  MovieDetailsWidget(
      {Key? key,
      required this.imageUrl,
      required this.description,
      required this.rate,
      required this.genres})
      : super(key: key);
  final String imageUrl;
  final String description;
  final double rate;
  final List genres;

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  List genresName = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      Provider.of<GetMoviesProvider>(context,listen: false).genreDataModel.forEach((element) {
        if (widget.genres.contains(element.id)) {
          genresName.add(element.name ?? '');
          setState(() {

          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
        left: 8,
        right: 8,
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 150,
            width: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.imageUrl,
                ),
              ),
            ),
            child: Container(
              height: 35,
              width: 25,
              color: Colors.grey,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: AppConstants.width(context) - 134,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppConstants.width(context) - 134,
                  height:
                      ((((AppConstants.width(context) - 144) / 3) / 2.5) + 5) *
                          (genresName.length / 3).ceil(),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: genresName.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 2.5,
                    ),
                    itemBuilder: (ctx, index) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child:  Text(
                        genresName[index],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      '${widget.rate}',
                      style: AppThemes.textStyle1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*

200

100


300

100


 */
