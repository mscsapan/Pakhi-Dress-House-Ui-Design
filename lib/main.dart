import 'package:flutter/material.dart';
import 'package:pakhi_dress_house/screen/home_screen.dart';

void main() => runApp(MaterialApp(
    home: HomeScreen(),
    theme: ThemeData(
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
    ),
    debugShowCheckedModeBanner: false));
