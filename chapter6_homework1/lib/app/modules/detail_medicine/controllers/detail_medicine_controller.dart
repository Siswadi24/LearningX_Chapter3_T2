import 'package:chapter6_homework1/app/data/medicine_model.dart';
import 'package:chapter6_homework1/app/modules/home/controllers/home_controller.dart';
import 'package:chapter6_homework1/app/utils/notification_api.dart';
import 'package:get/get.dart';

import '../../../data/notifications_model.dart';
import '../../../helper/db_helper.dart';

class DetailMedicineController extends GetxController {
  var db = DbHelper();
  HomeController homeController = Get.put(HomeController());
  late List<NotificationModel> listNotifications;

  //Method untuk mengambil data obat dari tabel medicine berdasarkan id dari obat.
  Future<MedicineModel> getMedicineData(int id) async {
    return await db.queryOneMedicine(id);
  }

  //Method untuk mengambil data notifikasi berdasarkan id obat yang diberikan, lalu menyimpannya ke dalam listNotification.
  Future<List<NotificationModel>> getNotificationData(int id) async {
    listNotifications = await db.getNotificationsByMedicineID(id);
    return listNotifications;
  }

  //Method Delete untuk menghapus data obat berdasarkan id dari obat.
  void deleteMedicine(int id) async {
    for (var element in listNotifications) {
      NotificationsApi.cancelNotification(element.id!);
    }

    await db.deleteMedicine(id);
    await db.deleteNotification(id);

    homeController.getAllMedicineData();
    Get.back();
  }
}
