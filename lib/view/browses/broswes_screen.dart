import 'package:flutter/material.dart';

import 'widget/browses_list_widget.dart';

class BrowsesScreen extends StatelessWidget {
  const BrowsesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(
            height: 60,
          ),
          Text(
            'Browse Category ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          BrowsesListWidget(),
        ],
      ),
    );
  }
}
