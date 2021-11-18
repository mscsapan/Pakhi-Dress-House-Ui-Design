import 'package:flutter/material.dart';
import '../controller/heading_controller.dart';
import '../screen/feed_screen.dart';
import '../screen/for_you_screen.dart';
import '../screen/new_collection.dart';
import '../screen/trending_screen.dart';
import 'package:provider/provider.dart';

class CategoryHeading extends StatelessWidget {
  final List<String> category = [
    'Feed',
    'New Collection',
    'Trending',
    'For You',
  ];

  final List<Widget> screens = [
    FeedScreen(),
    NewCollectionScreen(),
    TrendingScreen(),
    ForYouScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HeadingController>(context, listen: true);
    return SizedBox(
      height: 40.0,
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => controller.stateChange(index),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                child: Text(
                  category[index],
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 18.0,
                        color: controller.position == index
                            ? Colors.black
                            : Colors.black38,
                        fontWeight: controller.position == index
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                ),
              ),
              Container(
                height: 5.0,
                width: 5.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.position == index
                      ? Colors.orange
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
