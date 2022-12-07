import 'package:flutter/material.dart';

class NewReleaseWidget extends StatelessWidget {
  const NewReleaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, bottom: 8,),
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
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Image.asset(
                      'assets/images/ronaldo.png',
                      fit: BoxFit.cover,
                      width: 70,
                      height: 1000,
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
              itemCount: 10,
            ),
          ),

        ],
      ),
    );
  }
}
