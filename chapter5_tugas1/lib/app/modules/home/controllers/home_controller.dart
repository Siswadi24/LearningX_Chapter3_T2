import 'package:chapter5_tugas1/app/data/model/restaurant_model.dart';
import 'package:chapter5_tugas1/app/data/providers/restaurant_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<ListRestoransModel> getRestaurantModel() async {
    final listDataRestaurant = await RestaurantProvider().getListRestaurant();
    return listDataRestaurant;
  }
}
