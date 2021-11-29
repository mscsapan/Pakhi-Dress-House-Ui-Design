import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakhi_dress_house/screen/order_details.dart';
import '../controller/heading_controller.dart';
import '../view/payment_provider.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatelessWidget {
  final appColor = Color(0xFFf8f8f8);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: appColor));
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // final controller = Provider.of<HeadingController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Choose Payment Option',
          // style: TextStyle(color: Color(0xFF959595)),
        ),
        //leading: Icon(Icons.arrow_back),
        iconTheme: IconThemeData(color: Color(0xFF959595)),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        // color: Colors.red,
        child: Column(
          children: [
            PaymentProvider(),
            SizedBox(height: 10.0),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            height: 80.0,
            width: double.infinity,
            color: Color(0xFF10383c),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: SizedBox(
                width: screenWidth - 15.0,
                child: Consumer<HeadingController>(
                  builder: (context, controller, child) => MaterialButton(
                    onPressed: () {
                      // print('${controller.cardPosition + 1}');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OrderDetails()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    color: Color(0xFFf2c467),
                    child: Text(
                      'Confirm Payment',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
