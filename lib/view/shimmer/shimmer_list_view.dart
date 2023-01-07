import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({Key? key, required this.width, required this.height}) : super(key: key);

  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[600]!,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Container(
            height: height.toDouble(),
            width: width.toDouble(),
            color: Colors.white,
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            width: 12,
          );
        },
        itemCount: 8,
      ),
    );
  }
}
