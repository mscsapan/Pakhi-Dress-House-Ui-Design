import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

headingText(String title) => Text(
      title,
      style: GoogleFonts.openSans(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        color: Colors.black45,
        letterSpacing: 1.2,
      ),
    );
