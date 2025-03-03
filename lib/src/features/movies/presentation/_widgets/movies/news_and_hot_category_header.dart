import 'package:flutter/material.dart';

class NewsAndHotCategoryHeader extends SliverPersistentHeaderDelegate {
  NewsAndHotCategoryHeader({required this.onCategoryTap});
  final void Function(int) onCategoryTap;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (index) {
          return TextButton(
            onPressed: () => onCategoryTap(index),
            child: Text('หมวด $index'),
          );
        }),
      ),
    );
  }

  @override
  double get maxExtent => 50;
  @override
  double get minExtent => 50;
  @override
  bool shouldRebuild(
    covariant SliverPersistentHeaderDelegate oldDelegate,
  ) =>
      true;
}
