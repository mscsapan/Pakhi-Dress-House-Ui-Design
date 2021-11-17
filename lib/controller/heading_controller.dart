import 'package:flutter/material.dart';

class HeadingController extends ChangeNotifier {
  int position = 0;
  int swipe_position = 0;

  void stateChange(int index) {
    position = index;
    notifyListeners();
  }

  void swipeDots(int index) {
    swipe_position = index;
    notifyListeners();
  }
}
