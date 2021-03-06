import 'package:flutter/material.dart';
import 'package:flutter_login_screen/Pages/login/forgotScreen.dart';
import 'package:flutter_login_screen/Pages/home/home.dart';
import 'package:flutter_login_screen/Pages/login/loginController.dart';
import 'package:flutter_login_screen/widgets/mySize.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
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
                          textStyle: const TextStyle(
                              fontSize: 40, color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 80),
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
                                if (loginController.getRegister.isTrue)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText:
                                          loginController.showPassword.value,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        focusColor: Colors.white,
                                        fillColor: Colors.blue[50],
                                        filled: true,
                                        prefixIcon: const Icon(
                                          Icons.people,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        labelText: "İsim Soyisim",
                                        labelStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                const MySize(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: TextFormField(
                                    onChanged: loginController.usernameChanged,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 0.0),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      fillColor: Colors.blue[50],
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      labelText: "E posta",
                                      errorText:
                                          loginController.errorText.value,
                                      prefixIcon: const Icon(
                                        Icons.mail,
                                        color: Colors.black,
                                      ),
                                      labelStyle: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const MySize(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    obscureText:
                                        loginController.showPassword.value,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      focusColor: Colors.white,
                                      fillColor: Colors.blue[50],
                                      filled: true,
                                      prefixIcon: const Icon(
                                        Icons.key,
                                        color: Colors.black,
                                      ),
                                      suffixIcon: IconButton(
                                          color: Colors.black,
                                          onPressed: () {
                                            loginController.showPasswordFunc();
                                          },
                                          icon: loginController
                                                  .showPassword.isTrue
                                              ? const Icon(
                                                  Icons.remove_red_eye_sharp)
                                              : const Icon(
                                                  Icons.visibility_off)),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      labelText: "Şifre",
                                      labelStyle: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const MySize(),
                                if (loginController.getRegister.isTrue)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText:
                                          loginController.showPassword.value,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        focusColor: Colors.white,
                                        fillColor: Colors.blue[50],
                                        filled: true,
                                        prefixIcon: const Icon(
                                          Icons.phone,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        labelText: "Telefon Numarası",
                                        labelStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                if (loginController.getRegister.isFalse)
                                  TextButton(
                                    child: const Text("Şifremi Unuttum"),
                                    onPressed: () {
                                      Get.to(ForgotScreen());
                                    },
                                  ),
                                ElevatedButton(
                                  child: loginController.getRegister.isFalse
                                      ? const Text("Giriş yap")
                                      : const Text("Kayıt Ol"),
                                  onPressed: () {
                                    if (Platform.isIOS) {
                                      const AlertDialog(
                                        title: Text('Başarıyla Giriş Yaptınız'),
                                      );
                                    } else {}
                                  },
                                ),
                                TextButton(
                                  child: loginController.getRegister.isFalse
                                      ? const Text("Kayıt Ol")
                                      : const Text(
                                          "Zaten bir hesabınız var mı?"),
                                  onPressed: () {
                                    loginController.registerWidget();
                                    debugPrint(loginController.getRegister.value
                                        .toString());
                                  },
                                ),
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
