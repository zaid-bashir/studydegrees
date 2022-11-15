// ignore_for_file: must_be_immutable, prefer_const_constructors, annotate_overrides

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppMutliLineTextField extends GetView {
  AppMutliLineTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.textInputType,
    this.validator,
  }) : super(key: key);
  String hintText;
  String? Function(String? value)? validator;
  TextEditingController? controller;
  TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
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
        validator: validator,
        controller: controller,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          fontFamily: GoogleFonts.mulish().fontFamily,
          color: const Color(0XFF848484),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: GoogleFonts.mulish().fontFamily,
            color: const Color(0XFFB3B3B3),
          ),
          contentPadding: EdgeInsets.only(left: 12),
        ),
      ),
    );
  }
}
