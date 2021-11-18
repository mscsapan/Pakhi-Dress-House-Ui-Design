import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Feed Screen',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 20.0,
              ),
        ),
      ),
    );
  }
}
