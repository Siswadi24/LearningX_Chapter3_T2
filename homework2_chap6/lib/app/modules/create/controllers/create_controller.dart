import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController ingredientController;
  late TextEditingController instructionController;
  late TextEditingController estimateController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(String title, String ingredient, String instruction,
      String estimate) async {
    try {
      await firestore.collection('resep').add({
        'title': title,
        'ingredients': ingredient,
        'instructions': instruction,
        'time_estimation': estimate
      });

      Get.back();
      Get.snackbar('Success', 'Data added successfully');
      titleController.clear();
      ingredientController.clear();
      instructionController.clear();
      estimateController.clear();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    ingredientController = TextEditingController();
    instructionController = TextEditingController();
    estimateController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    ingredientController.dispose();
    instructionController.dispose();
    estimateController.dispose();
    super.onClose();
  }
}
