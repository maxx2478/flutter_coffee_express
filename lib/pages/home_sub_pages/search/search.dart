import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_universal_base/pages/home_sub_pages/search/search_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../extensions/views.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    Provider.of<SearchViewModel>(context, listen: false).searchResults = null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 55),
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
                        Provider.of<SearchViewModel>(context, listen: false)
                            .searchListForResults(value);
                      },
                      maxLength: 50),
                  const SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Consumer<SearchViewModel>(
                        builder: (context, viewModel, child) {
                      if (viewModel.searchResults == null) {
                        return Animate(effects: [FadeEffect(delay: 500.ms)],child: Center(child: paragraphText("Type your query in the searchbox")));
                      } else if (viewModel.searchResults?.isEmpty == true) {
                        return Center(child: paragraphText("No Data"));
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: viewModel.searchResults?.length ?? 0,
                            itemBuilder: (context, index) {
                              var item = viewModel.searchResults?[index];
                              return SizedBox(
                                height: 80,
                                child: Card(
                                  color: Colors.brown.shade700,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Animate(
                                      effects: [FadeEffect(), MoveEffect()],
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          Card(
                                              color: Colors.transparent,
                                              borderOnForeground: false,
                                              clipBehavior: Clip.antiAlias,
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: Image.network(
                                                  width: size.width*0.12,
                                                  height: 50,
                                                  fit: BoxFit.cover,
                                                  item?.url ?? "")),
                                          SizedBox(
                                            width: size.width*0.4,
                                            height: 45,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(left: 10),
                                                  child: titleText(
                                                      item?.title.trim() ?? "", 9)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width*0.45,
                                            height: 48,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                  )
                ]),
              ),
            )));
  }
}
