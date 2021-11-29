import 'package:flutter/material.dart';
import '../screen/payment_method.dart';
import 'package:provider/provider.dart';
import 'controller/heading_controller.dart';
import 'screen/order_details.dart';

void main() => runApp(
      MaterialApp(
        // home: PaymentMethodScreen(),

        home: ChangeNotifierProvider(
            create: (context) => HeadingController(), child: OrderDetails()),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: IconThemeData(color: Color(0xFF959595)),
          appBarTheme: AppBarTheme(
              backgroundColor: Color(0xFFf8f8f8),
              elevation: 0.0,
              titleTextStyle:
                  TextStyle(color: Color(0xFF959595), fontSize: 18.0)),
          scaffoldBackgroundColor: Color(0xFFf8f8f8),
        ),
      ),
    );
