import 'package:flutter/material.dart';

class RecommendedMovieWidget extends StatelessWidget {
  const RecommendedMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 10,
                  color: Colors.grey.shade700,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/ronaldo.png',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                            //  height: 1000,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.deepOrange,
                                      size: 10,
                                    ),
                                    Text(
                                      '7.7',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
                                    )
                                  ],
                                ),
                                Text(
                                  'Ronaldo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '2012 R 75',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
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
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  width: 12,
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
