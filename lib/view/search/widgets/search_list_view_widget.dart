import 'package:flutter/material.dart';
import 'package:movie_app_spark/view/shared/list_view_item.dart';

class SearchListViewWidget extends StatelessWidget {
  const SearchListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (ctx, index) => const ListViewItem(
          imageUrl: 'assets/images/ronaldo.png',
          title: 'title title titletitle title title titletitletitletitletitle',
          description:

              'description description description description description description descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription',
      check: false,
        ),
        separatorBuilder: (ctx, index) => const Divider(
          color: Colors.grey,
          thickness: 0.7,
        ),
        itemCount: 20,
      ),
    );
  }
}
