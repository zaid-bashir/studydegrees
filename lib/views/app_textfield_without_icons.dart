// ignore_for_file: must_be_immutable, prefer_const_constructors, annotate_overrides

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextFieldWithoutIcons extends GetView {
  AppTextFieldWithoutIcons({
    Key? key,
    this.controller,
    this.validator,
    this.isCenter = false,
    required this.hintText,
  }) : super(key: key);
  String hintText;
  TextEditingController? controller;
  String? Function(String? value)? validator;
  bool isCenter;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0XFFB3B3B3), width: 0),
        boxShadow: const [
          BoxShadow(
            blurStyle: BlurStyle.outer,
            blurRadius: 16,
            color: Color(0X4BB2B2B2),
            spreadRadius: 0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          fontFamily: GoogleFonts.mulish().fontFamily,
          color: const Color(0XFF848484),
        ),
        validator: validator,
        textAlign: isCenter ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: GoogleFonts.mulish().fontFamily,
            color: const Color(0XFFB3B3B3),
          ),
          contentPadding:
              isCenter ? EdgeInsets.zero : EdgeInsets.only(left: 12),
        ),
      ),
    );
  }
}
