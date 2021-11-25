import 'package:flutter/material.dart';
import '../screen/check_out_screen.dart';

void main() => runApp(
      MaterialApp(
        home: CheckoutScreen(),

        /*ChangeNotifierProvider(
            create: (context) => HeadingController(), child: MyCartScreen()),*/
        debugShowCheckedModeBanner: false,
      ),
    );
