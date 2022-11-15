// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController textController;
  final bool isCreateLeadField;
  final String labelText;
  final String hintText;
  final Color borderColor;
  final double? height;
  final int? maxLength;
  final TextInputType? textInputType;
  final bool obscureText;
  final int? maxLines;
  final bool changeOnFocus;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final Icon? imagePathOfSuffixIcon;
  final void Function()? suffixIcononTap;
  final TextInputAction? textInputAction;
  final double? suffixIconwidth;
  final double? suffixIconHeight;
  final Color? suffixIconColor;
  final bool enabled;
  final void Function(bool)? onFocusChange;
  final TextCapitalization? textCapitalization;
  final TextInputFormatter? textInputFormatter;
  final bool allCaps;
  final String? Function(String? value)? validator;
  const CustomTextFormField({
    super.key,
    this.textInputType,
    this.prefixIcon,
    this.validator,
    this.isCreateLeadField = true,
    required this.textController,
    this.textInputAction,
    required this.labelText,
    this.enabled = true,
    this.maxLines = 1,
    required this.hintText,
    this.changeOnFocus = false,
    this.allCaps = false,
    required this.borderColor,
    this.keyboardType,
    this.onChanged,
    this.suffixIcononTap,
    this.imagePathOfSuffixIcon,
    this.suffixIconHeight,
    this.obscureText = false,
    this.suffixIconwidth,
    this.maxLength,
    this.height,
    this.onFocusChange,
    this.suffixIconColor,
    this.textCapitalization,
    this.textInputFormatter,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: widget.onFocusChange ??
          (value) {
            setState(() {
              hasFocus = value;
              if (widget.allCaps && !hasFocus) {
                widget.textController.text =
                    widget.textController.text.toUpperCase();
              }
            });
          },
      child: Container(
        child: TextFormField(
          inputFormatters: widget.textInputFormatter == null
              ? []
              : [widget.textInputFormatter!],
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          maxLines: widget.maxLines,
          maxLength: widget.keyboardType == TextInputType.number
              ? 16
              : widget.maxLength,
          onChanged: widget.onChanged ?? (value) {},
          keyboardType: widget.keyboardType,
          obscureText: (widget.changeOnFocus) ? !hasFocus : widget.obscureText,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF242424),
          ),
          enabled: widget.enabled,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          controller: widget.textController,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.grey,
              ), //<-- SEE HERE
            ),
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 1,
                  color: widget.isCreateLeadField
                      ? const Color(0XFFCECECE)
                      : const Color(0XFF5A5A5A)), //<-- SEE HERE
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.redAccent,
                width: 1,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(
              minHeight: 0,
            ),
            suffixIcon: widget.imagePathOfSuffixIcon != null
                ? GestureDetector(
                    onTap: widget.suffixIcononTap,
                    child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: widget.imagePathOfSuffixIcon),
                  )
                : null,
            floatingLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6C6C6C),
            ),
            labelText: widget.labelText,
            hintText: widget.hintText,
            counterStyle: const TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
            prefixStyle: const TextStyle(
              color: Color(0xFFBBBBBB),
              fontSize: 14,
            ),
            labelStyle: const TextStyle(
              color: Color(0xFFBBBBBB),
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.only(
              left: 16,
              top: 12,
            ),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
