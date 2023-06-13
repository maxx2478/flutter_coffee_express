import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universal_base/pages/home_sub_pages/dashboard/dashboard.dart';

import 'home_sub_pages/search/search.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPage = 0;
  var listOfPages = [
    DashboardPage(),
    SearchPage(),
    DashboardPage(),
    DashboardPage(),
    DashboardPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 62, 39, 35),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade700,
        onPressed: () {  },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.brown.shade100,
        activeColor: Colors.brown.shade900,
        blurEffect: true,
        icons: const [Icons.home_outlined, Icons.search_outlined, Icons.list_outlined, Icons.shopping_cart],
        activeIndex: currentPage,
        inactiveColor: Colors.black26,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 30,
        rightCornerRadius: 30,
        onTap: (index) => setState(() => currentPage = index),
        //other params
      ),
      body: listOfPages[currentPage],
    );
  }
}
