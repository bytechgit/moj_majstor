import 'package:flutter/material.dart';
import 'package:moj_majstor/AppState.dart';
import 'package:provider/provider.dart';

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
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.search,
                                size: 30,
                                color: Color.fromARGB(255, 121, 121, 121),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextField(
                                style: TextStyle(fontSize: 20),
                                decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search'),
                              ),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                            print("aaa");
                          },
                          icon: Icon(
                            Icons.tune,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Card(
                        child: SizedBox(
                          width: 90,
                          height: 90,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Image(
                                  width: 50,
                                  image:
                                      AssetImage('assets/img/kategorija1.png'),
                                ),
                              ),
                              Expanded(child: Container()),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, left: 5, right: 5),
                                child: FittedBox(child: Text('Moler')),
                              )
                            ],
                          ),
                        ),
                        color: Color.fromARGB(255, 217, 222, 255),
                        elevation: 4,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            Card(
                              child: SizedBox(
                                width: 90,
                                height: 90,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image(
                                        width: 50,
                                        image: AssetImage(
                                            'assets/img/kategorija1.png'),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: FittedBox(child: Text('Moler')),
                                    )
                                  ],
                                ),
                              ),
                              color: Colors.white,
                              elevation: 3,
                            ),
                            Card(
                              child: SizedBox(
                                width: 90,
                                height: 90,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image(
                                        width: 50,
                                        image: AssetImage(
                                            'assets/img/kategorija3.png'),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: FittedBox(child: Text('Moler')),
                                    )
                                  ],
                                ),
                              ),
                              color: Colors.white,
                              elevation: 3,
                            ),
                            Card(
                              child: SizedBox(
                                width: 90,
                                height: 90,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image(
                                        width: 50,
                                        image: AssetImage(
                                            'assets/img/kategorija3.png'),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: FittedBox(child: Text('Moler')),
                                    )
                                  ],
                                ),
                              ),
                              color: Colors.white,
                              elevation: 3,
                            ),
                            Card(
                              child: SizedBox(
                                width: 90,
                                height: 90,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image(
                                        width: 50,
                                        image: AssetImage(
                                            'assets/img/kategorija3.png'),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: FittedBox(child: Text('Moler')),
                                    )
                                  ],
                                ),
                              ),
                              color: Colors.white,
                              elevation: 3,
                            ),
                            Card(
                              child: SizedBox(
                                width: 90,
                                height: 90,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image(
                                        width: 50,
                                        image: AssetImage(
                                            'assets/img/kategorija1.png'),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: FittedBox(child: Text('Moler')),
                                    )
                                  ],
                                ),
                              ),
                              color: Colors.white,
                              elevation: 3,
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
