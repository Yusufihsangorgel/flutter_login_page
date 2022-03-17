import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var showPassword = true.obs;
  var username = ''.obs;
  RxnString errorText = RxnString(null);
  Rxn<Function()> submitFunc = Rxn<Function()>(null);

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

  void validations(String val) async {
    errorText.value = null; // reset validation errors to nothing
    submitFunc.value = null; // disable submit while validating
    if (val.isNotEmpty) {
      if (lengthOK(val) && await available(val)) {
        debugPrint('All validations passed, enable submit btn...');
        submitFunc.value = submitFunction();
        errorText.value = null;
      }
    }
  }

  bool lengthOK(String val, {int minLen = 5}) {
    if (val.length < minLen) {
      errorText.value = 'min. 5 chars';
      return false;
    }
    return true;
  }

  Future<bool> available(String val) async {
    debugPrint('Query availability of: $val');
    await Future.delayed(
        const Duration(seconds: 1), () => print('Available query returned'));

    if (val == "Sylvester") {
      errorText.value = 'Name Taken';
      return false;
    }
    return true;
  }

  void usernameChanged(String val) {
    username.value = val;
  }

  Future<bool> Function() submitFunction() {
    return () async {
      debugPrint('Make database call to create ${username.value} account');
      await Future.delayed(
          const Duration(seconds: 1), () => debugPrint('User account created'));
      return true;
    };
  }
}
