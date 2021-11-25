import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'others_view.dart';

class PriceOverView extends StatelessWidget {
  final List<String> title = [
    'Item',
    'Subtotal',
    'Shipping Charge',
  ];
  final List<String> charges = ['3', '\$430.0', 'Free'];

  Widget priceRow(String title, String price) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 14.0)),
          Text(
            price,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 16.0,
            ),
          ),
        ],
      );

  buildBill(index) => priceRow(title[index], charges[index]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DraggableScrollableSheet(
          initialChildSize: 1.0,
          maxChildSize: 1.0,
          minChildSize: 0.8,
          expand: false,
          builder: (context, scroll) {
            return Card(
              elevation: 5.0,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  controller: scroll,
                  children: [
                    headingText('Price Overview'),
                    Column(
                      children: List.generate(
                          title.length, (index) => buildBill(index)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Coupon',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                                fontSize: 14.0)),
                        Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            label: Text('View Coupon'.toUpperCase(),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16.0)))
                      ],
                    ),
                    priceRow('Save', '\$25.0'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
