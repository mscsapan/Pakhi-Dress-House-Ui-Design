import 'package:flutter/material.dart';
import '../controller/heading_controller.dart';
import '../model/product_list.dart';
import '../view/dot.dart';
import 'package:provider/provider.dart';

class ScrollingImage extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double height = 200.0;
    final controller = Provider.of<HeadingController>(context, listen: true);
    return Container(
      height: height,
      width: double.infinity,
      //color: Colors.red,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) => controller.swipeDots(index),
            children: List.generate(
              scrollImage.length,
              (index) => Container(
                height: height,
                //margin: EdgeInsets.symmetric(horizontal: 6.0),
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    scrollImage[index],
                    fit: BoxFit.cover,
                    height: height,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height - 30.0,
            right: 150.0,
            child: Row(
              children: List.generate(
                scrollImage.length,
                (index) => DotView(
                  height: 12,
                  position: controller.swipe_position,
                  index: index,
                  colors: Colors.deepOrange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
