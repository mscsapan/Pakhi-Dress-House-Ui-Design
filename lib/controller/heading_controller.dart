import 'package:flutter/material.dart';
import '../model/product_model.dart';

class HeadingController extends ChangeNotifier {
  int position = 0;
  int swipe_position = 0;
  int totalItem = 1;
  int item = 1;
  var cartItem = <Product>[];
  int cardPosition = 0;
  int couponPosition = 0;

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

  void checkPaymentOption(int index) {
    cardPosition = index;
    notifyListeners();
  }

  void couponChoose(int index) {
    couponPosition = index;
    notifyListeners();
  }

  //bottom navigation bar

  int bottomIndex = 0;
  void bottomNavState(int index) {
    bottomIndex = index;
    notifyListeners();
  }
}
