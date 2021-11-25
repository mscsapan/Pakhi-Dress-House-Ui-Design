import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'others_view.dart';

class ShippingAddress extends StatelessWidget {
  final String address =
      '15 Street, West Sewrapara\nDhaka, Bangladesh\nMobile: 01624188877';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.2,
      width: double.infinity,
      child: Card(
        elevation: 5.0,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headingText('Shipping Address'),
                    Chip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        label: Text('Change')),
                  ])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(address,
                style: GoogleFonts.openSans(
                    fontSize: 16.5,
                    //color: Colors.black12,
                    letterSpacing: 1.0)),
          )
        ]),
      ),
    );
  }
}
