import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_universal_base/utils/constants.dart';

import '../../../../utils/extensions/views.dart';

class OrdersPage extends StatefulWidget {
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 48),
        child: Animate(
          effects: [MoveEffect(duration: 200.ms)],
          child: Animate(
            effects: [FadeEffect(delay: 50.ms)],
            child: ListView(
              children: [
                headerText("My Orders", 27),
                headerText("Ordered in last 3 Months", 15),
                const SizedBox(
                  height: 5,
                ),
                ListView.builder(
                    itemCount: listOfProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = listOfProducts[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.brown.shade300.withOpacity(0.5),
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.15,
                                child: Card(
                                    color: Colors.transparent,
                                    borderOnForeground: false,
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: networkImage(item.url)),
                              ),
                              SizedBox(
                                width: size.width * 0.50,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      headerText(item.title.trim(), 11),
                                      titleText(
                                          index % 2 == 0
                                              ? "Status: In-Transit"
                                              : "Status: Delivered",
                                          11),
                                      titleText(
                                          "Order Placed on: ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                                          11)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.20,
                                 height: 25,
                                 child: Container(
                                   child: MaterialButton(
                                      color: Colors.brown.shade300.withOpacity(0.8),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      child: buttonText("Buy Again"), onPressed: (){},),
                                 )
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
