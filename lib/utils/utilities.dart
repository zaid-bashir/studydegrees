import 'package:flutter/material.dart';

class Utilities {
  //? Email VALIDATION uSING rEGEX
  //?=============================
  bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(email);
  }

  //? Phone Number VALIDATION uSING rEGEX
  //?=============================
  bool isPhoneNo(String phoneNo) {
    String p = r'^(\+91)?(-)?\s*?(91)?\s*?(\d{3})-?\s*?(\d{3})-?\s*?(\d{4})';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(phoneNo);
  }

  //? Name VALIDATION uSING rEGEX
  //?=============================
  bool isName(String name) {
    RegExp nameRegExp = RegExp('[a-zA-Z]');
    return nameRegExp.hasMatch(name);
  }

  //? Pincode VALIDATION uSING rEGEX
  //?=============================
  bool isValidPincode(String pincode) {
    RegExp pincodeRegExp = RegExp(r'^[1-9][0-9]{5}$');
    return pincodeRegExp.hasMatch(pincode);
  }

  //? GST VALIDATION uSING rEGEX
  //?=============================
  bool isValidGST(String gst) {
    RegExp gstReg =
        RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');
    return gstReg.hasMatch(gst);
  }

  //? PAN VALIDATION uSING rEGEX
  //?=============================
  bool isValidPAN(String pan) {
    RegExp panReg = RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]{1}');
    return panReg.hasMatch(pan);
  }

  //? Genearte a PrimarySwatch from Color
  //?====================================
  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
