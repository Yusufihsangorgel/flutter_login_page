import 'package:flutter/material.dart';
import 'package:flutter_login_screen/Pages/forgot/forgotController.dart';
import 'package:flutter_login_screen/Pages/login/loginController.dart';
import 'package:flutter_login_screen/Pages/login/loginScreen.dart';
import 'package:flutter_login_screen/widgets/mySize.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;

class ForgotScreen extends StatelessWidget {
  ForgotScreen({Key? key}) : super(key: key);
  final ForgotController forgotController = Get.put(ForgotController());
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "images/logo.png",
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "LOGİN TEXT",
                  style: GoogleFonts.bebasNeue(
                      textStyle:
                          const TextStyle(fontSize: 40, color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 80),
                  child: Container(
                      color: Colors.transparent,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: loginController.showPassword.value,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent, width: 0.0),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  focusColor: Colors.white,
                                  fillColor: Colors.blue[50],
                                  filled: true,
                                  prefixIcon: const Icon(
                                    Icons.people,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  labelText: "E Posta",
                                  labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            MySize(),
                            ElevatedButton(
                              child: const Text("Doğrulama postası gönder"),
                              onPressed: () {
                                if (Platform.isIOS) {
                                  const AlertDialog(
                                    title: Text(
                                        'Doğrulama postası başarıyla gönderildi'),
                                  );
                                } else {}
                              },
                            ),
                            TextButton(
                              child: Text("Zaten bir hesabınız var mı?"),
                              onPressed: () {
                                Get.to(LoginScreen());
                              },
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
