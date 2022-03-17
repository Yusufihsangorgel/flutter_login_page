import 'package:flutter/material.dart';
import 'package:flutter_login_screen/Pages/home/home.dart';
import 'package:flutter_login_screen/Pages/login/loginController.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: ClipRect(
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "images/logo.png",
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      fillColor: Colors.blue[100],
                      //   filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelText: "Kullanıcı Adı",
                      prefixIcon: const Icon(
                        Icons.login,
                        color: Colors.black,
                      ),

                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(
                    () => TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: loginController.showPassword.value,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Colors.blue[100],
                        //filled: true,
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              loginController.showPasswordFunc();
                            },
                            icon: loginController.showPassword.isTrue
                                ? Icon(Icons.remove_red_eye_sharp)
                                : Icon(Icons.visibility_off)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: "Şifre",
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text("Şifremi Unuttum"),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: const Text("Giriş yap"),
                    onPressed: () {
                      if (Platform.isIOS) {
                        const AlertDialog(
                          title: const Text('Başarıyla Giriş Yaptınız'),
                        );
                        Get.to(HomeScreen());
                      } else {}
                    },
                  ),
                  TextButton(
                    child: const Text("Kayıt Ol"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}