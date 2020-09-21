import 'package:dark_mode_login_and_signup_ui/models/input_model.dart';
import 'package:dark_mode_login_and_signup_ui/providers/signup_ui_provider.dart';
import 'package:dark_mode_login_and_signup_ui/widgets/cool_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;

    final signUpUIProvider = Provider.of<SignUpUIProvider>(context);

    final List<UserInputTextField> textFields = signUpUIProvider.getTextFields;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff181830),
      ),
      backgroundColor: Color(0xff181830),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Create Account',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please fill the inputs below.',
                style: TextStyle(
                  color: Color(0xffb8b8c0),
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 40,
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
                            signUpUIProvider.setFocus(textFields[i + 1].label);
                            FocusScope.of(context).nextFocus();
                          } else {
                            signUpUIProvider.setFocus(
                              textFields[i].label,
                              setTo: false,
                            );
                          }
                        },
                        onTap: () {
                          if (!textFields[i].inFocus) {
                            signUpUIProvider.setFocus(textFields[i].label);
                            // setState(() {
                            //   emailInFocus = false;
                            //   passInFocus = true;
                            // });
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
              Center(child: CoolBtn(scrSize: scrSize, text: 'SIGN UP')),
              SizedBox(
                height: scrSize.height * .1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff889098)),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Sign In',
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
