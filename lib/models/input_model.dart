import 'package:flutter/cupertino.dart';

class UserInputTextField {
  String label;
  Icon icon;
  bool inFocus;
  bool obscureText;
  TextInputType keyboardType;

  UserInputTextField({
    this.label,
    this.icon,
    this.inFocus = false,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });
}
