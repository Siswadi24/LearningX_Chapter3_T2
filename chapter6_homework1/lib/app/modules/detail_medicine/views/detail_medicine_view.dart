import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_medicine_controller.dart';

class DetailMedicineView extends GetView<DetailMedicineController> {
  const DetailMedicineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailMedicineView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailMedicineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
