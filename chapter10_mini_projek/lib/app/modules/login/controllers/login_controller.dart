import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  bool isObsecure = true;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final String title;
  late final String hint;
  late final Widget? widget;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  late final FocusNode usernameFocusNode;
  late final FocusNode passwordFocusNode;

  RxBool isUsernameInvalid = false.obs;
  RxBool isPasswordInvalid = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    usernameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    usernameFocusNode.dispose();
    passwordFocusNode.dispose();

    isUsernameInvalid.value = false;
    isPasswordInvalid.value = false;
    super.dispose();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUser(String username) {
    return firestore.collection("users").doc(username).snapshots();
  }

  // Login Function menggunakan username dan password
  void login(String username, String password) async {
    isLoading.value = true;
    try {
      final getUsernameAndPassword = getUser(username);
      final data = await getUsernameAndPassword.first;
      if (data.exists && data.data()?['username'] == username) {
        if (data.data()?['password'] == password) {
          isLoading.value = false;
          Get.snackbar("Login Berhasil", "Selamat Datang $username",
              colorText: Colors.white,
              backgroundColor: const Color.fromARGB(131, 253, 65, 65));
          await firestore
              .collection('users')
              .doc(username)
              .update({'isLogin': true});
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', username);
          Get.offAllNamed('/home');
        } else {
          isLoading.value = false;
          Get.snackbar("Error", "Password Tidak Sesuai",
              colorText: Colors.white,
              backgroundColor: const Color.fromARGB(131, 253, 65, 65));
          update();
        }
      } else {
        isLoading.value = false;
        Get.snackbar("Error", "Username Tidak Terdaftar",
            colorText: Colors.white, backgroundColor: Colors.red);
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  void focus() {
    usernameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus) {
        isUsernameInvalid.value = true;
      } else {
        isUsernameInvalid.value = false;
      }
      update();
    });
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        isPasswordInvalid.value = true;
      } else {
        isPasswordInvalid.value = false;
      }
      update();
    });
    super.onClose();
  }
}
