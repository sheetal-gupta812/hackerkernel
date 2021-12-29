import 'package:flutter/material.dart';
import 'package:hackerkernel/Widgets/text.dart';

import 'color.dart';

class WidthButton extends StatelessWidget {
  final wordspace;
  final VoidCallback onPressed;
  final String textName;
  final double width;
  final Color textColor;
  final Color buttonColor;

  WidthButton(
      {this.wordspace = 2,
      required this.textName,
      required this.onPressed,
      required this.width,
      required this.textColor,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: buttonColor,
          ),
          onPressed: () {
            onPressed();
          },
          child: AppText(
            textName,
            color: textColor,
            size: 16,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
