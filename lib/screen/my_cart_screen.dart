import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pakhi_dress_house/view/count_button.dart';
import 'package:transparent_image/transparent_image.dart';
import '../model/product_model.dart';
import 'package:provider/provider.dart';

import '../controller/heading_controller.dart';

class MyCartScreen extends StatelessWidget {
  final String size = 'XL';
  final String colors = 'Black';

  @override
  Widget build(BuildContext context) {
    final countController =
        Provider.of<HeadingController>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          leading: IconButton(
            onPressed: () {},
            splashRadius: 25.0,
            icon: Icon(Icons.arrow_back),
          ),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'MyCart',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: '(${countController.totalItem} Items)',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              splashRadius: 25.0,
              onPressed: () => countController.itemCount(),
              icon: FaIcon(
                FontAwesomeIcons.commentAlt,
                color: Colors.black12,
              ),
            ),
          ],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              Product product = products[index];
              return Container(
                height: 130.0,
                width: double.infinity,
                //color: Colors.deepOrange,
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                child: GestureDetector(
                  onTap: () => print(index),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          //margin: EdgeInsets.all(6.0),
                          width: MediaQuery.of(context).size.width * 0.3,
                          // color: Colors.deepOrange,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Stack(
                              children: [
                                Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.orange,
                                        strokeWidth: 2.0)),
                                FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: product.image,
                                    fit: BoxFit.fill,
                                    height: 125.0,
                                    width: MediaQuery.of(context).size.width *
                                        0.3),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  overflow: TextOverflow.ellipsis),
                              SizedBox(height: 4.0),
                              Text(
                                index % 3 == 0
                                    ? '\$30.0'
                                    : index % 2 == 0
                                        ? '\$25.0'
                                        : '\$20.0',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                '\$${product.price - 34.75}',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text('Size: $size',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                      color: Colors.black)),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Color: $colors',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                          color: Colors.black)),
                                  SizedBox(width: 40.0),
                                  CartCountButton(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.grey),
          child: Card(
            elevation: 5.0,
            child: Container(
              height: 60.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              // color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Amount: ${countController.totalAmount}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(width: 5.0),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    onPressed: () {},
                    textColor: Colors.white,
                    color: Colors.deepOrange,
                    child: Text('Check out'.toUpperCase()),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
