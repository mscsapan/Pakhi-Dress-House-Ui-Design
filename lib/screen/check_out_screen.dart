import 'package:flutter/material.dart';
import '../view/order_summary.dart';
import '../view/price_overview.dart';
import '../view/shipping_address.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            ShippingAddress(),
            OrderSummary(),
            PriceOverView(),
          ],
        ),
      ),
    );
  }
}
