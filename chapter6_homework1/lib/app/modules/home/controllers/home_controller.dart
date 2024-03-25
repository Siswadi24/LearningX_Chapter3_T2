import 'package:chapter6_homework1/app/helper/db_helper.dart';
import 'package:get/get.dart';

import '../../../data/medicine_model.dart';

class HomeController extends GetxController
    with StateMixin<List<MedicineModel>> {
  var db = DbHelper();
  List<MedicineModel> listMedicines = <MedicineModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllMedicineData();
  }

  Future getAllMedicineData() async {
    change(null, status: RxStatus.loading());
    listMedicines.clear();
    final List<MedicineModel> medicines = await db.queryAllRowsMedicine();
    listMedicines.addAll(medicines);

    if (listMedicines.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(listMedicines, status: RxStatus.success());
      print(listMedicines);
    }
  }
}
