import 'dart:async';

import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  // final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 4), () {
      // Navigasi ke halaman berikutnya
      Get.offNamed('/register');
    });
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
