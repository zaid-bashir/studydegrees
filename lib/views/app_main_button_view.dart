// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studydegrees/constants/colors.dart';

class AppMainButtonView extends GetView {
  AppMainButtonView(
      {Key? key,
      required this.child,
      this.iconName,
      this.isScannerType = false,
      required this.onTap,
      this.isPlaneButton = false})
      : super(key: key);
  Widget child;
  bool isPlaneButton;
  String? iconName;
  bool isScannerType;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: isPlaneButton ? Colors.transparent : primaryColor,
          borderRadius: BorderRadius.circular(30),
          border: isPlaneButton
              ? Border.all(color: const Color(0XFFCECECE))
              : Border.all(color: Colors.transparent),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
