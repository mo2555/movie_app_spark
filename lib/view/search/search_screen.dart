import 'package:flutter/material.dart';

import 'widgets/search_list_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 50
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.grey
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                    color: Colors.grey
                ),
              ),
              fillColor: const Color(0xFF232423),
              filled: true,
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SearchListWidget(),
        ],
      ),
    );
  }
}
