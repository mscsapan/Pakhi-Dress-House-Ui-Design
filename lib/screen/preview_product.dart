import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import '../controller/heading_controller.dart';
import '../model/product_list.dart';
import '../view/dot.dart';
import 'package:provider/provider.dart';

class PreviewProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Preview Product Screen'),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.shoppingBag),
                SizedBox(width: 20.0),
                FaIcon(FontAwesomeIcons.commentAlt)
              ],
            )
          ],
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.55,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Consumer<HeadingController>(
                builder: (context, controller, child) => PageView(
                  physics: ClampingScrollPhysics(),
                  onPageChanged: (index) => controller.swipeDots(index),
                  children: List.generate(
                    images.length - 10,
                    (index) => Stack(
                      children: [
                        Center(
                            child: CircularProgressIndicator(
                                color: Colors.deepOrange)),
                        FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: images[index],
                            fit: BoxFit.fill,
                            height: screenHeight * 0.55,
                            width: double.infinity),
                        Positioned(
                          right: 15.0,
                          bottom: 5.0,
                          child: Chip(
                            backgroundColor: Colors.orange,
                            label: Text('View Similar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length - 10,
                (index) => Consumer<HeadingController>(
                  builder: (context, controller, child) => DotView(
                    height: 10.0,
                    index: index,
                    position: controller.swipe_position,
                    colors: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: screenHeight * 0.24,
        width: screenWidth,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              margin: EdgeInsets.only(bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 6.0,
                      width: 80.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Text(
                    'Pakhi🦜',
                    style: GoogleFonts.raleway(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: Text(
                          names[0],
                          style: GoogleFonts.raleway(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.heart),
                          SizedBox(width: 12.0),
                          FaIcon(FontAwesomeIcons.share),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0)
                    .copyWith(left: 0.0, right: 0.0),
                child: Container(
                  color: Color(0xFF14363c),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.15, vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('\$290.00',
                                  style: GoogleFonts.poppins(
                                      fontSize: 20.0, color: Colors.white)),
                              //SizedBox(height: 2.0),
                              Text(
                                '\$30.00',
                                style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.35,
                          height: 50.0,
                          child: MaterialButton(
                            onPressed: () {},
                            color: Color(0xFFf2c467),
                            child: Text('Add To Cart'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
