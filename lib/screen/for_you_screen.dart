import 'package:flutter/material.dart';

class ForYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'For You Screen',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 20.0,
              ),
        ),
      ),
    );
  }
}
