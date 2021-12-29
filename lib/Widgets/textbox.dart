import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackerkernel/Widgets/text.dart';

import 'color.dart';

class WidthTextBox extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final String textName;
  final Color color;
  final String hintText;
  final Icon icon;
  final FontWeight weight;
  final String validatorText;

  const WidthTextBox({
    Key? key,
    required this.controller,
    required this.width,
    required this.textName,
    required this.color,
    required this.hintText,
    required this.icon,
    required this.weight,
    required this.validatorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          textName,
          color: color,
          fontWeight: weight,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          width: width,
          height: 60,
          padding:
              const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
          decoration: const BoxDecoration(
            color: ColorData.primary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return validatorText;
              }
              return null;
            },
            controller: controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              suffixIcon: icon,
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: GoogleFonts.montserrat(
                color: ColorData.grey.withOpacity(.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: GoogleFonts.montserrat(
              color: ColorData.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordTextBox extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final String textName;
  final Color color;
  final String hintText;
  final Icon icon;
  final FontWeight weight;
  final String validatorText;

  const PasswordTextBox({
    Key? key,
    required this.controller,
    required this.width,
    required this.textName,
    required this.color,
    required this.hintText,
    required this.icon,
    required this.weight,
    required this.validatorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          textName,
          color: color,
          fontWeight: weight,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          width: width,
          height: 60,
          padding:
          const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
          decoration: const BoxDecoration(
            color: ColorData.primary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextFormField(
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return validatorText;
              }
              return null;
            },
            controller: controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              suffixIcon: icon,
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: GoogleFonts.montserrat(
                color: ColorData.grey.withOpacity(.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: GoogleFonts.montserrat(
              color: ColorData.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
