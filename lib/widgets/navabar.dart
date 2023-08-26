import 'package:flutter_svg/svg.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x2E193F00).withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      height: 64,
      child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Stack(
                children: [
                  const Center(
                    child: ImageIcon(
                      AssetImage("assets/icons/Compas.png"),
                      size: 32,
                    ),
                  ),
                  (_tabController.index == 0)
                      ? Stack(
                          children: [
                            const Center(
                              child: ImageIcon(
                                AssetImage("assets/icons/Compas.png"),
                                size: 32,
                              ),
                            ),
                            Center(
                                child: Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(32, 134, 82, 255),
                                    spreadRadius: 10,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, -15), // changes position of shadow
                                  ),
                                ],
                              ),
                            ))
                          ],
                        )
                      : Container()
                ],
              ),
            ),
            Tab(
              child: Stack(
                children: [
                  const Center(
                    child: ImageIcon(
                      AssetImage("assets/icons/Bee2.png"),
                      size: 24,
                    ),
                  ),
                  (_tabController.index == 1)
                      ? Stack(
                          children: [
                            const Center(
                              child: ImageIcon(
                                AssetImage("assets/icons/Bee2.png"),
                                size: 24,
                              ),
                            ),
                            Center(
                                child: Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(32, 134, 82, 255),
                                    spreadRadius: 10,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, -15), // changes position of shadow
                                  ),
                                ],
                              ),
                            ))
                          ],
                        )
                      : Container()
                ],
              ),
            ),
            Tab(
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 13,
                      backgroundImage: AssetImage("assets/icons/Avatar.jpg"),
                    ),
                  ),
                  (_tabController.index == 2)
                      ? Stack(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 13,
                                backgroundImage:
                                    AssetImage("assets/icons/Avatar_s.jpg"),
                              ),
                            ),
                            Center(
                                child: Icon(
                              Icons.circle_outlined,
                              size: 36,
                              color: Colors.deepPurple[100],
                              weight: 5,
                            )),
                            const Center(
                              child: Icon(
                                Icons.circle_outlined,
                                size: 34,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                                child: Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(32, 134, 82, 255),
                                    spreadRadius: 10,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, -15), // changes position of shadow
                                  ),
                                ],
                              ),
                            ))
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ],
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 30.0),
          indicatorColor: const Color.fromRGBO(134, 82, 255, 1),
          labelColor: const Color.fromRGBO(134, 82, 255, 1),
          unselectedLabelColor: Colors.grey[600],
          indicatorSize: (TabBarIndicatorSize.tab),
          indicator: MaterialIndicator(
              height: 3,
              bottomLeftRadius: 2,
              bottomRightRadius: 2,
              topLeftRadius: 0,
              topRightRadius: 0,
              tabPosition: TabPosition.top,
              color: const Color.fromRGBO(134, 82, 255, 1))),

      //Change ,
    );
  }
}
