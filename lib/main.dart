import 'package:dark_mode_login_and_signup_ui/providers/signin_ui_provider.dart';
import 'package:dark_mode_login_and_signup_ui/providers/signup_ui_provider.dart';
import 'package:dark_mode_login_and_signup_ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:dark_mode_login_and_signup_ui/screens/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpUIProvider>(
          create: (_) => SignUpUIProvider(),
        ),
         ChangeNotifierProvider<SignInUIProvider>(
          create: (_) => SignInUIProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dark mode login and signup ui',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (_) => LoginScreen(),
          '/SignUpScreen': (_) => SignUpScreen(),
        },
      ),
    );
  }
}
