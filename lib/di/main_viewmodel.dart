import 'package:flutter/material.dart';
import 'package:flutter_universal_base/utils/constants.dart';
import 'package:flutter_universal_base/business/domain/product_model.dart';

import '../utils/extensions/views.dart';

class MainViewModel extends ChangeNotifier {
  List<ProductModel>? searchResults;
  List<ProductModel> cartItems = [];

  void addItemToCart(ProductModel? productModel) {
    productModel != null
        ? {
            cartItems.contains(productModel)
                ? {
              showToast("Already added in cart")
            }
                : {productModel.quantity = 1, cartItems.add(productModel),
            showToast("Added to cart!")}
          }
        : null;
    
    notifyListeners();
  }

  void increaseQuantity(int index) {
    if (cartItems.isEmpty || (cartItems.length < index)) {
      showToast("Something went wrong..");
    } else {
      cartItems[index].quantity++;
    }
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (cartItems.isEmpty || (cartItems.length < index)) {
      showToast("Something went wrong..");
    } else {
      cartItems[index].quantity--;
      cartItems[index].quantity == 0
          ? {cartItems.removeAt(index), showToast("Item Removed")}
          : null; //Remove the item from cart if the quantity is zero
    }
    notifyListeners();
  }

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
