import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var showPassword = true.obs;
  var username = ''.obs;
  var eMail = ''.obs;
  var getRegister = false.obs;

  RxnString errorText = RxnString(null);

  @override
  void onInit() {
    super.onInit();
    debounce<String>(username, validations,
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
    errorText.value = null; // reset validation errors to nothing
    if (val.isNotEmpty) {
      if (lengthOK(val)) {
        debugPrint('All validations passed, enable submit btn...');
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
    username.value = val;
  }

  void eMailChanged(String val) {}
}
