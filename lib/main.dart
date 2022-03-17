import 'package:flutter/material.dart';
import 'package:flutter_login_screen/Pages/login/loginScreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginScreen(),
    );
  }
}
