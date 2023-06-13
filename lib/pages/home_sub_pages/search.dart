import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../extensions/views.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
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
                  textFormField(valueKey: "Search Coffee Name", controller: searchController, enabled: true, func: (){}, maxLength: 50)
                ]),
              ),
            )));
  }
}
