import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'controller/heading_controller.dart';
import 'screen/main_screen.dart';

void main() {
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color(0xFFf8f8f8)));
  runApp(
    MaterialApp(
      // home: PaymentMethodScreen(),
      home: ChangeNotifierProvider(
          create: (context) => HeadingController(), child: MainScreen()),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color(0xFF959595)),
        appBarTheme: AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Color(0xFFf8f8f8)),
          backgroundColor: Color(0xFFf8f8f8),
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Color(0xFF959595), fontSize: 18.0),
          iconTheme: IconThemeData(color: Color(0xFF959595)),
        ),
        scaffoldBackgroundColor: Color(0xFFf8f8f8),
        tabBarTheme: TabBarTheme(
            labelStyle: TextStyle(fontSize: 20.0), labelColor: Colors.green),
      ),
      title: 'Pakhi Dress House',
    ),
  );
}
