import 'package:flutter/material.dart';

class HomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  double closedHeight;
  double openHeight;

  HomeHeaderDelegate({
    this.toolBarHeight = 0,
    this.closedHeight = 0,
    required this.openHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: toolBarHeight + openHeight,
      color: Colors.white,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: [
              Card(
                child: SizedBox(
                  width: 70,
                  height: 70,
                ),
                color: Colors.red,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: const [
                    Card(
                      child: SizedBox(
                        width: 70,
                        height: 70,
                      ),
                      color: Colors.red,
                    ),
                    Card(
                      child: SizedBox(
                        width: 70,
                        height: 70,
                      ),
                      color: Colors.red,
                    ),
                    Card(
                      child: SizedBox(
                        width: 70,
                        height: 70,
                      ),
                      color: Colors.red,
                    ),
                    Card(
                      child: SizedBox(
                        width: 70,
                        height: 70,
                      ),
                      color: Colors.red,
                    ),
                    Card(
                      child: SizedBox(
                        width: 70,
                        height: 70,
                      ),
                      color: Colors.red,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => toolBarHeight + openHeight;

  @override
  double get minExtent => toolBarHeight + closedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
