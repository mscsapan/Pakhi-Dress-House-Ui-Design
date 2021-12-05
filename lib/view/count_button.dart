import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartCountButton extends StatefulWidget {
  @override
  _CartCountButtonState createState() => _CartCountButtonState();
}

class _CartCountButtonState extends State<CartCountButton> {
  int item = 1;

  countButton(
          {required IconData icon,
          required Color color,
          required Function() onTap}) =>
      Container(
        height: 25.0,
        width: 25.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 25.0,
          onPressed: onTap,
          icon: FaIcon(
            icon,
            size: 16.0,
            color: Colors.black87,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        countButton(
            onTap: () => setState(() => item > 1 ? item-- : item),
            color: Colors.grey.withOpacity(0.2),
            icon: FontAwesomeIcons.minus),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(
            '${item.toString()}'.padLeft(2, '0'),
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        countButton(
          onTap: () => setState(() => item++),
          color: Colors.teal,
          icon: FontAwesomeIcons.plus,
        ),
      ],
    );
  }
}
