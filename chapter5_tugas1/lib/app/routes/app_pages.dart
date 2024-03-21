import 'package:chapter5_tugas1/app/modules/home/bindings/detail_binding.dart';
import 'package:chapter5_tugas1/app/modules/home/controllers/detail_controller.dart';
import 'package:chapter5_tugas1/app/modules/home/views/detail_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const DETAILREST = Routes.DETAILREST;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: _Paths.DETAILREST,
      page: () => const DetailView(),
      binding: DetailBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
