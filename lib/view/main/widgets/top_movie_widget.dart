import 'package:flutter/material.dart';

class TopMovieWidget extends StatelessWidget {
  const TopMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/images/ronaldo.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Text1 Text1 Text1 Text1 Text1 Text1 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Text2 Text2',
                        style: TextStyle(
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
                  Image.asset(
                    'assets/images/ronaldo.png',
                    fit: BoxFit.cover,
                    height: 180,
                    width: 120,
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
  }
}
