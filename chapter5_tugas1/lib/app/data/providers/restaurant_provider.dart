import 'package:chapter5_tugas1/app/data/model/detail_restaurant_model.dart';
import 'package:get/get.dart';

import '../model/restaurant_model.dart';

class RestaurantProvider extends GetConnect {
  static const _apiUrlRest =
      "https://www.themealdb.com/api/json/v1/1/categories.php";

  //Get List Restaurant
  Future<ListRestoransModel> getListRestaurant() async {
    final response = await get(_apiUrlRest);
    if (response.statusCode == 200) {
      return ListRestoransModel.fromMap(
          (response.body as Map<String, dynamic>));
    } else {
      throw Exception('Maaf Gagal Melakukan Load Data Restaurant Dari API');
    }
  }

  //Get Detail List Restaurant Menggunakan Category (strCategory)
  Future<DetailRestaurantModel> getDetailRest(String category) async {
    final response = await get(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');
    if (response.statusCode == 200) {
      return DetailRestaurantModel.fromMap(
          (response.body as Map<String, dynamic>));
    } else {
      throw Exception(
          'Maaf Gagal Melakukan Load Data Detail Restaurant Dari API');
    }
  }
}
