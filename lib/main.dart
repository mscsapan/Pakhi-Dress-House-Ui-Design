import 'package:flutter/material.dart';
import 'package:pakhi_dress_house/controller/heading_controller.dart';
import 'package:provider/provider.dart';
import '../screen/my_cart_screen.dart';

void main() => runApp(
      MaterialApp(
        home: ChangeNotifierProvider(
            create: (context) => HeadingController(), child: MyCartScreen()),
        debugShowCheckedModeBanner: false,
      ),
    );
