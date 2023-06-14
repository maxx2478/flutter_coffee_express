import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_universal_base/presentation/pages/home_sub_pages/dashboard/product_widget.dart';
import '../../../../utils/extensions/views.dart';
import '../../../../di/main_viewmodel.dart';

import 'package:flutter_universal_base/utils/constants.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 48),
        child: Animate(
          effects: [MoveEffect(duration: 200.ms)],
          child: Animate(
            effects: [FadeEffect(delay: 50.ms)],
            child: ListView(
              children: [
                headerText("Coffee Express", 27),
                const SizedBox(
                  height: 5,
                ),
                headerText("Discover the royal taste COFFEE", 16),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 150,
                  child: Card(
                      borderOnForeground: false,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white12,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 150,
                          aspectRatio: 0.9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.01,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: listOfImages.map((url) {
                          return Builder(
                            builder: (BuildContext context) {
                              return SizedBox(
                                  child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                    width: double.infinity,
                                    height: 150,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 200,
                                            width: size.width * 0.5,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  headerText(url.offer, 15),
                                                  paragraphText("${url.desc}\n"),
                                                  paragraphText(url.footer,
                                                      size: 9)
                                                ],
                                              ),
                                            )),
                                        Container(
                                            alignment: Alignment.centerRight,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 160,
                                            width: size.width * 0.3,
                                            child: CachedNetworkImage(
                                              imageUrl: url.url,
                                              imageBuilder: (context, imageProvider) => Container(
                                                height: 160,
                                                width: size.width * 0.3,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(

                                                    image: imageProvider,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) => Container(
                                                  height: 25, width: 25, child: Container(height: 25, width : 25, child: const CircularProgressIndicator())),
                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                            )),
                                      ],
                                    )),
                              ));
                            },
                          );
                        }).toList(),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                headerText("The Bestsellers !", 16),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Card(
                    borderOnForeground: false,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.white12,
                    child: ListView.builder(
                      itemCount: listOfProducts.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = listOfProducts[index];
                        return Padding(
                          padding: const EdgeInsets.all(0),
                          child: Card(
                            margin:
                                const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                            color: Colors.transparent,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ProductWidget(productModel: item),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                titleText(
                    "Our coffees are 100% hygienic, organic and free from all kinds of impurities. Quality checks are done periodically to give our customers the best coffee experience!",
                    12),
                const SizedBox(height: 30,),
                Align(
                  alignment: Alignment.center,
                  child: headerText("© Coffee Express", 18),
                ),
                Align(
                  alignment: Alignment.center,
                  child: paragraphText("All Rights Reserved"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
