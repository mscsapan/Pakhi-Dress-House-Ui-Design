import 'package:flutter/material.dart';

class NewCollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          NewCollectionScreen().toString(),
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 20.0,
              ),
        ),
      ),
    );
  }
}
