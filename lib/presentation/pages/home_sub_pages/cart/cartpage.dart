import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_universal_base/utils/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../utils/extensions/views.dart';
import '../../../../viewmodels/main_viewmodel.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 45, bottom: 48),
        child: Animate(
          effects: [MoveEffect(duration: 200.ms)],
          child: Animate(
            effects: [FadeEffect(delay: 50.ms)],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                headerText("Cart", 27),
                headerText("Moving carts always look good !", 15),
                Expanded(
                  child: Consumer<MainViewModel>(
                    builder: (BuildContext context, viewModel, Widget? child) {
                      return Provider.of<MainViewModel>(context)
                              .cartItems
                              .isEmpty
                          ? Center(
                            child: paragraphText(
                                "No tasty coffees here, try adding one!", size: 12),
                          )
                          : ListView.builder(
                              padding: const EdgeInsets.only(top: 10),
                              itemCount: viewModel.cartItems.length,
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
                                                      BorderRadius.circular(
                                                          10)),
                                              child: networkImage(item.url)),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.50,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                headerText(
                                                    item.title.trim(), 11),
                                                titleText("\$5 per count", 11),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: size.width * 0.20,
                                            height: 25,
                                            child: Row(
                                              children: [
                                                Card(
                                                    color: Colors.white24,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                    child: InkWell(
                                                      splashColor: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: const Icon(
                                                        Icons.remove,
                                                        color: Colors.white70,
                                                        size: 18,
                                                      ),
                                                      onTap: () {
                                                        viewModel
                                                            .decreaseQuantity(
                                                                index);
                                                      },
                                                    )),
                                                Card(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                    child: Container(
                                                      height: 18,
                                                      width: 18,
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: headerText(
                                                            viewModel.cartItems[
                                                                    index].quantity
                                                                .toString(),
                                                            9),
                                                      ),
                                                    )),
                                                Card(
                                                    color: Colors.white24,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                    child: InkWell(
                                                      splashColor: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.white70,
                                                        size: 18,
                                                      ),
                                                      onTap: () {
                                                        viewModel
                                                            .increaseQuantity(
                                                                index);
                                                      },
                                                    )),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Provider.of<MainViewModel>(context).cartItems.isEmpty
                            ? SizedBox()
                            : MaterialButton(
                                elevation: 5,
                                color: Colors.brown.shade700,
                                height: 45,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () {},
                                child: titleText("Continue To Payment", 16),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Lottie.asset('assets/lottie/mastercards.json',
                                repeat: true, height: 30),
                            const SizedBox(
                              width: 15,
                            ),
                            Lottie.asset('assets/lottie/visa.json',
                                repeat: true, height: 30),
                            const SizedBox(
                              width: 15,
                            ),
                            Lottie.asset('assets/lottie/upi.json',
                                repeat: true,
                                height: 30,
                                alignment: Alignment.center),
                            const SizedBox(
                              width: 15,
                            ),
                            Lottie.asset('assets/lottie/secure.json',
                                repeat: true,
                                height: 30,
                                alignment: Alignment.center),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
