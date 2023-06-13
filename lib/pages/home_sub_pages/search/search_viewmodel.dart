import 'package:flutter/material.dart';
import 'package:flutter_universal_base/extensions/views.dart';

import '../../../utils/constants.dart';

class SearchViewModel extends ChangeNotifier {
  List<ProductModel>? searchResults = null;

  void searchListForResults(String query) {
    searchResults?.clear();
    if (query.isEmpty) {
      searchResults = [];
    } else {
      var result = listOfProducts.where((element) =>
          element.title.toLowerCase().contains(query.toLowerCase()));

      if (result.isEmpty) {
        searchResults = [];
      } else {
        searchResults = result.toList();
      }
    }

    notifyListeners();
  }
}
