import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationStatus extends StatelessWidget {
  final int index;
  NotificationStatus({required this.index});

  final List<String> title = [
    'Notification',
    'FAQ',
    'Region',
    'Offer',
  ];
  final List<IconData> icons = [
    FontAwesomeIcons.bell,
    FontAwesomeIcons.question,
    FontAwesomeIcons.mapMarkerAlt,
    FontAwesomeIcons.surprise,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0).copyWith(top: 0.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: 75.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: FaIcon(icons[index]),
                ),
                Text(
                  title[index],
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 18.0, color: Colors.black, letterSpacing: 1.0),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: FaIcon(FontAwesomeIcons.chevronRight),
            )
          ],
        ),
      ),
    );
  }
}
