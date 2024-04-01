import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController ingredientController;
  late TextEditingController instructionController;
  late TextEditingController estimateController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('resep').doc(docID);
    return docRef.get();
  }

  void updateData(String docID, String title, String ingredient,
      String instruction, String estimate) async {
    try {
      await firestore.collection('resep').doc(docID).update({
        'title': title,
        'ingredients': ingredient,
        'instructions': instruction,
        'time_estimation': estimate
      });

      Get.back();
      Get.snackbar('Success', 'Data updated successfully');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed updating data');
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
