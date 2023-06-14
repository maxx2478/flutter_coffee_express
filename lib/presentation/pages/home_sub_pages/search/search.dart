import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_universal_base/viewmodels/main_viewmodel.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../utils/extensions/views.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    Provider.of<MainViewModel>(context, listen: false).searchResults = null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.03,
                right: size.width * 0.03,
                top: 15,
                bottom: 55),
            child: Animate(
              effects: [MoveEffect(duration: 200.ms)],
              child: Animate(
                effects: [FadeEffect(delay: 50.ms)],
                child: ListView(children: [
                  headerText("Search", 27),
                  const SizedBox(
                    height: 5,
                  ),
                  headerText("We serve 20+ different kinds of Coffees", 16),
                  const SizedBox(
                    height: 12,
                  ),
                  textFormField(
                      valueKey: "Search Coffee Name",
                      controller: searchController,
                      enabled: true,
                      func: (value) {
                        Provider.of<MainViewModel>(context, listen: false)
                            .searchListForResults(value);
                      },
                      maxLength: 50),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Consumer<MainViewModel>(
                        builder: (context, viewModel, child) {
                      if (viewModel.searchResults == null) {
                        return Animate(
                            effects: [
                              FadeEffect(delay: 200.ms, duration: 1000.ms)
                            ],
                            child: Center(
                                child: Column(
                              children: [
                                paragraphText(
                                    "Type your query in the searchbox"),
                                Lottie.asset('assets/lottie/hotcoffie.json',
                                    repeat: true, height: 200)
                              ],
                            )));
                      } else if (viewModel.searchResults?.isEmpty == true) {
                        return Center(
                            child: Column(
                          children: [
                            paragraphText("No Results Found"),
                            Lottie.asset('assets/lottie/hotcoffie.json',
                                repeat: true, height: 200)
                          ],
                        ));
                      } else {
                        return Column(
                          children: [
                            paragraphText(
                                "Found ${viewModel.searchResults?.length ?? 0} results"),
                            const SizedBox(
                              height: 5,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: viewModel.searchResults?.length ?? 0,
                                itemBuilder: (context, index) {
                                  var item = viewModel.searchResults?[index];
                                  return SizedBox(
                                    height: 80,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      color: Colors.brown.shade300
                                          .withOpacity(0.8),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Animate(
                                          effects: const [
                                            FadeEffect(),
                                            MoveEffect()
                                          ],
                                          child: Row(
                                            children: [
                                              Container(
                                                width: size.width * 0.15,
                                                child: Card(
                                                    color: Colors.transparent,
                                                    borderOnForeground: false,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    elevation: 5,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: networkImage(
                                                        item?.url ?? "")),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.6,
                                                height: 50,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: titleText(
                                                          item?.title.trim() ??
                                                              "",
                                                          11)),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.10,
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .brown.shade700
                                                              .withOpacity(0.8),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.white,
                                                        hoverColor:
                                                            Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        onTap: () {
                                                          Provider.of<MainViewModel>(
                                                                  context, listen: false)
                                                              .addItemToCart(item);
                                                        },
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(2),
                                                          child: Icon(
                                                            Icons.add_outlined,
                                                            color: Colors.white,
                                                            size: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        );
                      }
                    }),
                  )
                ]),
              ),
            )));
  }
}
