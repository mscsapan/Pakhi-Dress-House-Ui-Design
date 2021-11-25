import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pakhi_dress_house/model/product_list.dart';
import 'package:pakhi_dress_house/model/product_model.dart';

import 'others_view.dart';

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.4,
      width: double.infinity,
      child: Card(
        elevation: 5.0,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headingText('Order Summary'),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      products.length,
                      (index) => index >= 8
                          ? Container(
                              height: 100.0,
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 3.0),
                              child: Card(
                                elevation: 0.5,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                margin: EdgeInsets.zero,
                                child: Row(
                                  children: [
                                    //images
                                    Container(
                                        width: screenWidth * 0.25,
                                        //color: Colors.red,
                                        margin: EdgeInsets.all(6.0),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: Image.network(images[index],
                                                fit: BoxFit.fill))),
                                    //product information
                                    SizedBox(
                                        width: screenWidth * 0.5,
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(products[index].name,
                                                    style: GoogleFonts.openSans(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                SizedBox(height: 5.0),
                                                Text(
                                                    'Size: ${products[index].size}'),
                                                SizedBox(height: 2.0),
                                                Text(
                                                    'Color: ${products[index].color}')
                                              ],
                                            ))),
                                    //pricing
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text('Qty 1'),
                                          SizedBox(height: 8.0),
                                          Text('\$20.0',
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.red)),
                                          SizedBox(height: 2.0),
                                          Text(
                                            '\$${products[index].price}',
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green[900],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
