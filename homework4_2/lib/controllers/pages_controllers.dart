import 'package:get/get.dart';

class PagesControllers extends GetxController {
  RxString text = "hello".obs;

  void toggleCase(bool isUpperCase) {
    if (isUpperCase) {
      if (text.value != text.value.toUpperCase()) {
        text.value = text.value.toUpperCase();
      }
    } else {
      if (text.value != text.value.toLowerCase()) {
        text.value = text.value.toLowerCase();
      }
    }
  }
}
