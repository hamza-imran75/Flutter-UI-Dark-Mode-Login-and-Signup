import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/input_model.dart';
import '../providers/signin_ui_provider.dart';
import '../widgets/cool_btn.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;

    final signInUIProvider = Provider.of<SignInUIProvider>(context);

    final List<UserInputTextField> textFields = signInUIProvider.getTextFields;

    return Scaffold(
      backgroundColor: Color(0xff181830),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(
                image: AssetImage('assets/undraw_access_account_99n59.png'),
              ),
              SizedBox(
                height: scrSize.height * .05,
              ),
              Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please sign in to continue.',
                style: TextStyle(
                  color: Color(0xffb8b8c0),
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                child: Column(children: <Widget>[
                  for (var i = 0; i < textFields.length; i++)
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color:
                              textFields[i].inFocus ? Color(0xff2e2541) : null,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        textInputAction: i + 1 != textFields.length
                            ? TextInputAction.next
                            : TextInputAction.done,
                        onFieldSubmitted: (val) {
                          if (i + 1 != textFields.length) {
                            signInUIProvider.setFocus(textFields[i + 1].label);
                            FocusScope.of(context).nextFocus();
                          } else {
                            signInUIProvider.setFocus(
                              textFields[i].label,
                              setTo: false,
                            );
                          }
                        },
                        onTap: () {
                          if (!textFields[i].inFocus) {
                            signInUIProvider.setFocus(textFields[i].label);
                          }
                        },
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        obscureText: textFields[i].obscureText,
                        keyboardType: textFields[i].keyboardType,
                        decoration: InputDecoration(
                          icon: textFields[i].icon,
                          border: InputBorder.none,
                          labelText: textFields[i].label,
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                ]),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CoolBtn(scrSize: scrSize, text: 'LOGIN'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Forogot Password?',
                      style: TextStyle(color: Color(0xff08f0e0)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: scrSize.height * .1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff889098)),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/SignUpScreen'),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff08f0e0)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
