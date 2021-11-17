import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

actionButton(IconData icon) => IconButton(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    onPressed: () {},
    icon: FaIcon(icon, color: Colors.black38));

PreferredSizeWidget appBar() => AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'P',
                style: GoogleFonts.annieUseYourTelescope(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'akhi',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 25.0,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.normal))
          ])),
          Row(
            children: [
              actionButton(FontAwesomeIcons.shoppingBag),
              actionButton(FontAwesomeIcons.heart),
              actionButton(FontAwesomeIcons.commentAlt),
            ],
          )
        ],
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
    );
