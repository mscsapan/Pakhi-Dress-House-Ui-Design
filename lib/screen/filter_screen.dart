import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/product_list.dart';
import 'package:transparent_image/transparent_image.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Product'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                shadowColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              onPressed: null,
              child: Text('Filter',
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0)),
            )
          ],
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '28 Top products found',
              style: GoogleFonts.openSans(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: GridView.builder(
                  itemCount: images.length,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14.0,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 14.0),
                  itemBuilder: (context, position) {
                    return Container(
                      height: 200.0,
                      width: screenWidth / 2.0,
                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: [
                                Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                Container(
                                  height: 180.0,
                                  margin: EdgeInsets.all(5.0),
                                  child: FadeInImage.memoryNetwork(
                                    fadeInDuration: Duration(milliseconds: 500),
                                    placeholder: kTransparentImage,
                                    image: images[position],
                                    fit: BoxFit.cover,
                                    height: 180.0,
                                    width: double.infinity,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Text(
                                names[position],
                                style: GoogleFonts.roboto(letterSpacing: 0.6),
                                overflow: TextOverflow.ellipsis,
                              )),
                          SizedBox(height: 4.0),
                          Text(
                            '\$${price[position] - 25.0}'.toString(),
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600, fontSize: 18.0),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
