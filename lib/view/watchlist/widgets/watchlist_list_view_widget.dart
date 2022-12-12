import 'package:flutter/material.dart';

import '../../shared/list_view_item.dart';

class WatchlistListViewWidget extends StatelessWidget {
  const WatchlistListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: 5,
          right: 5,
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(0),
          itemBuilder: (ctx, index) =>  const ListViewItem(
            imageUrl: 'assets/images/ronaldo.png',
            title:
                'title title titletitle title title titletitletitletitletitle',
            description:
                'description description description description description description descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription',
          check: true,
          ),
          separatorBuilder: (ctx, index) => const Divider(
            color: Colors.grey,
            thickness: 0.7,
          ),
          itemCount: 20,
        ),
      ),
    );
  }
}
