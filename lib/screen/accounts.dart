import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pakhi_dress_house/view/notification_status.dart';

class Accounts extends StatelessWidget {
  final Color color = Colors.grey.withOpacity(0.5);
  final double picSize = 100.0;
  final String image = 'assets/me.jpg';

  final List<IconData> icon = [
    FontAwesomeIcons.file,
    FontAwesomeIcons.user,
    FontAwesomeIcons.mapMarkerAlt,
  ];
  final List<String> title = ['Order', 'Profile', 'Location'];
  Widget buildRow(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.teal,
            ),
            child: FaIcon(
              icon[index],
              color: Colors.white,
              size: 28.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            title[index],
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color));
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color,
      appBar:
          AppBar(title: Text('Account', style: TextStyle(color: Colors.black))),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(10.0),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  height: height * 0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                          height: picSize,
                          width: picSize,
                          child: CircleAvatar(
                            minRadius: picSize,
                            child: ClipOval(
                              child: Image.asset(
                                image,
                                fit: BoxFit.fill,
                                height: picSize,
                                width: picSize,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Mohammad Sapan',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'mscsapan@gmail.com',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      SizedBox(
                        height: 110.0,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              List.generate(3, (index) => buildRow(index)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: List.generate(
                    4, (index) => NotificationStatus(index: index)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
