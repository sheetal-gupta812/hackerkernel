import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  String text;
  Color color;
  double size;
  FontWeight fontWeight;
  double wordspace;

  bool textCenter;
  AppText(
    this.text, {
    Key? key,
    this.color = Colors.white,
    this.size = 16,
    this.fontWeight = FontWeight.w600,
    this.wordspace = 1,
    this.textCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      textAlign: textCenter ? TextAlign.center : null,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        wordSpacing: wordspace,
      ),
    );
  }
}
