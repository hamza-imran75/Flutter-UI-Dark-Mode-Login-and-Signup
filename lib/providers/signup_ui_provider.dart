import 'package:flutter/material.dart';
import 'package:dark_mode_login_and_signup_ui/models/input_model.dart';

class SignUpUIProvider with ChangeNotifier {
  List<UserInputTextField> _userTextFields = [
    UserInputTextField(
      label: 'FULL NAME',
      icon: Icon(
        Icons.person_outline,
        color: Colors.white,
      ),
    ),
    UserInputTextField(
      label: 'PHONE',
      icon: Icon(
        Icons.phone_android,
        color: Colors.white,
      ),
      keyboardType: TextInputType.phone,
    ),
    UserInputTextField(
      label: 'EMAIL',
      icon: Icon(
        Icons.mail_outline,
        color: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
    ),
    UserInputTextField(
      label: 'PASSWORD',
      icon: Icon(
        Icons.lock_outline,
        color: Colors.white,
      ),
      obscureText: true,
    ),
    UserInputTextField(
      label: 'CONFIRM PASSWORD',
      icon: Icon(
        Icons.lock_outline,
        color: Colors.white,
      ),
      obscureText: true,
    ),
  ];

  List<UserInputTextField> get getTextFields => _userTextFields;

  void setFocus(String label, {bool setTo = true}) {
    _userTextFields.forEach((myTextField) {
      if (myTextField.label == label) {
        myTextField.inFocus = setTo;
      } else {
        myTextField.inFocus = false;
      }
    });
    notifyListeners();
  }
}
