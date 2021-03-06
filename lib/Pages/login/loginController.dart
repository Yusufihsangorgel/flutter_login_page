import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var showPassword = true.obs;

  var eMail = ''.obs;
  var getRegister = false.obs;

  RxnString errorText = RxnString(null);

  @override
  void onInit() {
    super.onInit();
    debounce<String>(eMail, validations,
        time: const Duration(milliseconds: 500));
  }

  void showPasswordFunc() {
    if (showPassword.isTrue) {
      showPassword.value = false;
    } else {
      showPassword.value = true;
    }
  }

  void registerWidget() {
    if (getRegister.isFalse) {
      getRegister.value = true;
    } else {
      getRegister.value = false;
    }
  }

  void validations(String val) async {
    errorText.value = null;
    if (val.isNotEmpty) {
      if (lengthOK(val)) {
        errorText.value = null;
      }
    }
  }

  bool lengthOK(String val, {int minLen = 5}) {
    if (val.length < minLen) {
      errorText.value = 'Minimum 5 karakter';
      return false;
    }
    return true;
  }

  void usernameChanged(String val) {
    eMail.value = val;
  }

  void eMailChanged(String val) {}
}
