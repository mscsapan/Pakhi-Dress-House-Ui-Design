import 'package:flutter/material.dart';
import '/screen/main_screen.dart';

class PlacedOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset('assets/placed_order.png', fit: BoxFit.cover),
              Text('Your order has been\nplaced successfully',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.green[900],
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 15.0),
              Chip(
                label: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Order ID: ',
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: '202 012 132 657',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 55.0,
                width: screenWidth * 0.6,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MainScreen(),
                      fullscreenDialog: false)),
                  style: ElevatedButton.styleFrom(primary: Color(0xFFf2c467)),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
