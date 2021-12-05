import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '/controller/heading_controller.dart';
import '/screen/preview_product.dart';
import 'package:provider/provider.dart';

class CouponScreen extends StatelessWidget {
  final String des =
      '10 EUR off on maximum card value purchase\nof 200 EUR on Pakhi';

  Widget promoCode(double height, int index, int couponPosition) {
    return Container(
      height: height * 0.1,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.0),
      child: DottedBorder(
        child: Row(
          children: [
            Container(
              height: 22.0,
              width: 22.0,
              padding: EdgeInsets.all(2.0),
              margin: EdgeInsets.only(right: 10.0, left: 5.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1.2)),
              child: Container(
                height: 18.0,
                width: 18.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: couponPosition == index
                      ? Colors.green[900]
                      : Colors.transparent,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'rrspromo'.toUpperCase(),
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5.0),
                Text(
                  des,
                  style: TextStyle(color: Colors.black45, fontSize: 14.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Coupon')),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.06,
              width: screenWidth,
              child: DottedBorder(
                strokeWidth: 1,
                dashPattern: [2, 2],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Coupon Code*',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Or',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 25.0),
            ),
            SizedBox(height: 15.0),
            Column(
              children: List.generate(
                4,
                (index) => Consumer<HeadingController>(
                  builder: (context, coupon, child) => GestureDetector(
                    onTap: () => coupon.couponChoose(index),
                    child: promoCode(
                      screenHeight,
                      index,
                      coupon.couponPosition,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: screenHeight * 0.12,
        width: screenWidth,
        color: Color(0xFF14363c),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Cancel'),
              ),
              SizedBox(
                width: screenWidth * 0.4,
                child: MaterialButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewProductScreen(),
                    ),
                  ),
                  color: Color(0xFFf2c467),
                  child: Text('Apply'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
