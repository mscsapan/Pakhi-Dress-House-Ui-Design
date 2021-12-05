import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../controller/heading_controller.dart';
import '../view/app_bar.dart';
import '../view/category_heading.dart';
import '../view/product_image.dart';
import '../view/scrolling_image.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white70));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        children: [
          ChangeNotifierProvider(
            create: (context) => HeadingController(),
            child: CategoryHeading(),
          ),
          ChangeNotifierProvider(
            create: (context) => HeadingController(),
            child: ScrollingImage(),
          ),
          SizedBox(height: 10.0),
          ProductImage(),
        ],
      ),
    );
  }
}
