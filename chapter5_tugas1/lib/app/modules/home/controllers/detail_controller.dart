import 'package:chapter5_tugas1/app/data/model/detail_restaurant_model.dart';
import 'package:get/get.dart';

import '../../../data/providers/restaurant_provider.dart';

class DetailController extends GetxController {
  Future<DetailRestaurantModel> getDetailRestaurant(
      String categoryDetail) async {
    final detailRestaurant =
        await RestaurantProvider().getDetailRest(Get.arguments);
    return detailRestaurant;
  }
}
