import 'package:flutter/material.dart';

class BrowsesListWidget extends StatelessWidget {
  const BrowsesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 5,
        ),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 50,
            crossAxisSpacing: 40,
            childAspectRatio: 1.7,
          ),
          itemBuilder: (ctx, index) {
            return Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/ronaldo.png',
                  ),
                ),
              ),
              child: const Text(
                'Action',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
