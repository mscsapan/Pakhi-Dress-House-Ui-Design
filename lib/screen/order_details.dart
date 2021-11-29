import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatelessWidget {
  verticalDivider() => VerticalDivider(thickness: 2.5, color: Colors.orange);
  dotAndVerticalLine(double height, index) => Column(children: [
        Container(
          height: 24.0,
          width: 24.0,
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.orange,
              width: 1.5,
            ),
          ),
          child: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
          ),
        ),
        index == 3
            ? SizedBox()
            : SizedBox(height: height / 6.3, child: verticalDivider())
      ]);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final DateTime time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Details'),
            Text(
              'Download PDF',
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        //leading: Icon(Icons.arrow_back),
        iconTheme: IconThemeData(color: Color(0xFF959595)),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.06,
              //color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.56,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order: 123 456 789 246',
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5.0),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Purchase Date: ',
                                style: GoogleFonts.roboto(
                                    fontSize: 14.0, color: Colors.black)),
                            TextSpan(
                                text: '${DateFormat.yMMMd().format(time)}',
                                style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600))
                          ]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 6.0),
                  Container(
                    width: screenWidth * 0.38,
                    alignment: Alignment.topCenter,
                    child: Chip(
                      backgroundColor: Colors.green.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        child: Text(
                          'Delivered',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.6,
              width: double.infinity,
              child: Row(
                children: [
                  //starting container
                  Container(
                    width: screenWidth * 0.45,
                    //color: Colors.green,
                    margin: EdgeInsets.only(right: 2.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(
                          4,
                          (index) => SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${DateFormat.yMMMMd().format(time)}',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${time.hour}:${time.minute} AM',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //middle container
                  Container(
                      width: screenWidth * 0.06,
                      child: Column(
                        children: [
                          Column(
                            children: List.generate(
                                3,
                                (index) =>
                                    dotAndVerticalLine(screenHeight, index)),
                          ),
                          Container(
                            height: 24.0,
                            width: 24.0,
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.orange,
                                width: 1.5,
                              ),
                            ),
                            child: Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      )),
                  //end container
                  Container(
                    width: screenWidth * 0.45,
                    color: Colors.red,
                    margin: EdgeInsets.only(left: 2.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
