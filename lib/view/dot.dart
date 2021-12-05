import 'package:flutter/material.dart';

class DotView extends StatelessWidget {
  final double height;
  final Color colors;
  final position;
  final int index;

  DotView(
      {Key? key,
      this.height = 14.0,
      this.colors = Colors.orange,
      required this.index,
      required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: position == index ? height : height - 5.0,
      width: position == index ? height : height - 5.0,
      margin: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors,
      ),
    );
  }
}
