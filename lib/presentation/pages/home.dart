import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'home_sub_pages/cart/cartpage.dart';
import 'home_sub_pages/dashboard/dashboard.dart';
import 'home_sub_pages/orders/orders.dart';
import 'home_sub_pages/search/search.dart';
import '../../viewmodels/main_viewmodel.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPage = 0;
  var listOfPages = [
    DashboardPage(),
    SearchPage(),
    OrdersPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var listOfIcons = [
      Icons.home_outlined,
      Icons.search_outlined,
      Icons.list_outlined,
      Icons.shopping_cart
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 62, 39, 35),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade700,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Consumer<MainViewModel>(builder: (context, viewModel, child)
        {
          return AnimatedBottomNavigationBar.builder(
            backgroundColor: Colors.brown.shade100,
            //activeColor: Colors.brown.shade900,
            blurEffect: true,
            // icons: const [Icons.home_outlined, Icons.search_outlined, Icons.list_outlined, Icons.shopping_cart],
            activeIndex: currentPage,
            // inactiveColor: Colors.black26,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            leftCornerRadius: 30,
            rightCornerRadius: 30,
            onTap: (index) => setState(() => currentPage = index),
            itemCount: 4,
            tabBuilder: (int index, bool isActive) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    listOfIcons[index],
                    size: 24,
                    color: isActive ? Colors.white : Colors.brown.shade900,
                  ),
                  index == 3
                      ? Positioned(
                    top: 5,
                    right: 15,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.brown.shade300,
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: AutoSizeText(
                          "${viewModel.cartItems.length}",
                          minFontSize: 9,
                          maxFontSize: 12,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                      : const SizedBox(
                    height: 0,
                  )
                ],
              );
            },
            //other params
          );
        },),

      body: listOfPages[currentPage],
    );
  }
}
