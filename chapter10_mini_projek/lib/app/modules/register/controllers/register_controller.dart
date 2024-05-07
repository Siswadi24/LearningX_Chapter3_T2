import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  bool isObsecureRegister = true;
  late final TextEditingController usernameController;
  late final TextEditingController nameController;
  late final TextEditingController addressController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late final FocusNode usernameFocusNode;
  late final FocusNode nameFocusNode;
  late final FocusNode addressFocusNode;
  late final FocusNode phoneFocusNode;
  late final FocusNode passwordFocusNode;
  late final FocusNode confirmPasswordFocusNode;

  RxBool isUsernameInvalid = false.obs;
  RxBool isNameInvalid = false.obs;
  RxBool isAddressInvalid = false.obs;
  RxBool isPhoneInvalid = false.obs;
  RxBool isPasswordInvalid = false.obs;
  RxBool isConfirmPasswordInvalid = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    usernameController = TextEditingController();
    nameController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    usernameFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();

    super.onInit();
    focus();
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    usernameFocusNode.dispose();
    nameFocusNode.dispose();
    addressFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    isUsernameInvalid.value = false;
    isNameInvalid.value = false;
    isAddressInvalid.value = false;
    isPhoneInvalid.value = false;
    isPasswordInvalid.value = false;
    isConfirmPasswordInvalid.value = false;
    super.dispose();
  }

//register function menggunakan Username, name, address, phone, password, confirmPassword
  void register(String username, String name, String address, String phone,
      String password, String confirmPassword) async {
    try {
      isLoading.value = true;
      await firestore.collection("users").doc(username).set({
        "username": username,
        "name": name,
        "address": address,
        "phone": phone,
        "password": password,
        "confirmPassword": confirmPassword
      });
      Get.back();
      Get.snackbar("Register Berhasil", "Silahkan Login",
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(131, 253, 65, 65),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
      isLoading.value = false;
      usernameController.clear();
      nameController.clear();
      addressController.clear();
      phoneController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      update();
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
    nameFocusNode.addListener(() {
      if (nameFocusNode.hasFocus) {
        isNameInvalid.value = true;
      } else {
        isNameInvalid.value = false;
      }
      update();
    });
    addressFocusNode.addListener(() {
      if (addressFocusNode.hasFocus) {
        isAddressInvalid.value = true;
      } else {
        isAddressInvalid.value = false;
      }
      update();
    });
    phoneFocusNode.addListener(() {
      if (phoneFocusNode.hasFocus) {
        isPhoneInvalid.value = true;
      } else {
        isPhoneInvalid.value = false;
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
    confirmPasswordFocusNode.addListener(() {
      if (confirmPasswordFocusNode.hasFocus) {
        isConfirmPasswordInvalid.value = true;
      } else {
        isConfirmPasswordInvalid.value = false;
      }
      update();
    });
  }
}
