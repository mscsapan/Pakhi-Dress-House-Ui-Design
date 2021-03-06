import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pakhi_dress_house/screen/filter_screen.dart';

class OrderDetails extends StatelessWidget {
  verticalDivider() => VerticalDivider(thickness: 2.5, color: Colors.orange);

  Widget titleText(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
    );
  }

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
            : SizedBox(height: height / 8.2, child: verticalDivider())
      ]);

  Widget rightPart() {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText('Delivered'),
                Text(
                  'Customer Confirmed delivery of order by Mohammad Pakhi',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText('Shipped'),
                Text(
                  'Successfully delivery.',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText('Picked'),
                Text(
                  'Mohammad is picking up our\nproduct from Pakhi Dess House',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText('Picked'),
                Text(
                  'Delivery assigned to delivery hero from Pakhi.',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
        // iconTheme: IconThemeData(color: Color(0xFF959595)),
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
                      onDeleted: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => FilterScreen())),
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
              height: screenHeight * 0.5,
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
                                4,
                                (index) =>
                                    dotAndVerticalLine(screenHeight, index)),
                          ),
                        ],
                      )),
                  //end container
                  Container(
                    width: screenWidth * 0.45,
                    //color: Colors.red,
                    margin: EdgeInsets.only(left: 2.0),
                    child: rightPart(),
                  ),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Text(
                  'Shipping Address',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: screenHeight * 0.16,
        width: screenWidth,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(5, 0),
                blurRadius: 2.0,
              )
            ]),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Row(
            children: [
              Container(
                height: screenHeight * 0.06,
                width: screenHeight * 0.06,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[400],
                ),
                child:
                    FaIcon(FontAwesomeIcons.mapMarkerAlt, color: Colors.white),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('012 463 178 21',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400)),
                  Text(
                    'Sector 10, Uttara, Dhaka',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
                  ),
                  Text(
                    'Bangladesh',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
