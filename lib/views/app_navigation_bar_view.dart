// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppNavigationBarView extends GetView {
  AppNavigationBarView({
    Key? key,
    required this.title,
    this.leftButton,
    this.leftButtonAction,
    this.leftIcon,
    this.rightButton,
    this.rightButtonAction,
    this.rightIcon,
  }) : super(key: key);
  String title;
  final Widget? leftButton;
  final Widget? leftIcon;
  final VoidCallback? leftButtonAction;
  final Widget? rightButton;
  final Widget? rightIcon;
  final VoidCallback? rightButtonAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: leftButton,
      iconTheme: const IconThemeData(
        color: Color(0XFF5A5A5A),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      elevation: 0,
      backgroundColor: const Color(0XFFFFE4DB),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0XFF5A5A5A),
        ),
      ),
      actions: [
        if (rightIcon != null)
          IconButton(onPressed: rightButtonAction, icon: rightIcon!)
        else if (rightButton != null)
          GestureDetector(onTap: rightButtonAction, child: rightButton)
      ],
    );
  }
}
