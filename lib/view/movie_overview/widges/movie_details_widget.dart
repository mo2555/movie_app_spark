import 'package:flutter/material.dart';

class MovieDetailsWidget extends StatelessWidget {
  MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
        left: 12,
        bottom: 15,
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 170,
            width: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/ronaldo.png'))),
            child: Container(
              color: Colors.grey,
              height: 35,
              width: 25,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieCat(),
              SizedBox(
                width: MediaQuery.of(context).size.width - 152,
                child: const Text(
                  'Text TextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextText',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade900,
                  ),
                  Text(
                    '7.7',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MovieCat extends StatelessWidget {
  MovieCat({Key? key}) : super(key: key);
  final List test = [
    1,
    2,
    3,
    4,
  ];

  @override
  Widget build(BuildContext context) {
    double size = (((MediaQuery.of(context).size.width - 152) / 3) / 2.2);

    return SizedBox(
      height: (test.length / 3).ceil() * size + ((test.length / 3).ceil() * 5),
      width: MediaQuery.of(context).size.width - 152,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 2.2,
        ),
        itemBuilder: (ctx, index) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          child: Text(
            'Action',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
