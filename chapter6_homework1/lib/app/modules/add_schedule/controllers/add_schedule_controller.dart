import 'package:chapter6_homework1/app/data/medicine_model.dart';
import 'package:chapter6_homework1/app/data/notifications_model.dart';
import 'package:chapter6_homework1/app/helper/db_helper.dart';
import 'package:chapter6_homework1/app/modules/home/controllers/home_controller.dart';
import 'package:chapter6_homework1/app/utils/notification_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScheduleController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController frequencyController;
  final List<TextEditingController> timeController =
      [TextEditingController()].obs;

  var db = DbHelper();
  final frequency = 0.obs;

  HomeController homeController = Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
    NotificationsApi.init();

    nameController = TextEditingController();
    frequencyController = TextEditingController();
  }

  void add(String name, int frequency) async {
    await db.insertMedicine(MedicineModel(name: name, frequency: frequency));

    var lastMedicineId = await db.getLastMedicineId();

    for (var i = 0; i < frequency; i++) {
      await db.insertNotification(NotificationModel(
          idMedicine: lastMedicineId, time: timeController[i].text));
    }

    List<NotificationModel> notifications =
        await db.getNotificationsByMedicineID(lastMedicineId);

    for (var element in notifications) {
      NotificationsApi.scheduledNotification(
        id: element.id!,
        title: 'Waktunya Minum Obat $name',
        body: 'Saatnya minum obat agar cepat sembuh ya... :)',
        payload: name,
        scheduledDate: DateTime(int.parse(element.time.split(':')[0]),
            int.parse(element.time.split(':')[1]), 0),
      );
    }

    homeController.getAllMedicineData();
    Get.back();
  }
}
