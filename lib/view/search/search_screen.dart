import 'package:flutter/material.dart';
import 'package:movie_app_spark/providers/search_data_provider.dart';
import 'package:movie_app_spark/view/search/widgets/search_list_view_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(
        top: 50,
        right: 15,
        left: 15,
        bottom: 5,
      ),
      child: Consumer<SearchDataProvider>(builder: (context, provider, _) {
        return Column(
          children: [
            TextField(
              onChanged: (value) {
                if(value.isNotEmpty){
                  provider.searchMovie(q: value);
                }
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                fillColor: const Color(0xFF373636),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const SearchListViewWidget(),
          ],
        );
      }),
    );
  }
}
