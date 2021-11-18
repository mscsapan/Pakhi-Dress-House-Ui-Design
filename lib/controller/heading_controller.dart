import 'package:flutter/material.dart';
import 'package:pakhi_dress_house/model/product_model.dart';

class HeadingController extends ChangeNotifier {
  int position = 0;
  int swipe_position = 0;
  int totalItem = 1;
  int item = 1;
  var cartItem = <Product>[];

  double get totalAmount =>
      <Product>[].fold(0, (sum, item) => sum + item.price);

  void addToCart(Product product) {
    cartItem.add(product);
    notifyListeners();
  }

  void stateChange(int index) {
    position = index;
    notifyListeners();
  }

  void swipeDots(int index) {
    swipe_position = index;
    notifyListeners();
  }

  void itemCount() {
    totalItem++;
    notifyListeners();
  }

  void totalProductCount(int num) {
    if (num == 0) {
      if (item > 1) {
        item--;
        notifyListeners();
      }
    }
    if (num == 1) {
      item++;
      notifyListeners();
    }
  }
}
