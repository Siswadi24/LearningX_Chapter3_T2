import 'package:get/get.dart';
import 'package:homework4_2/bindings/pages_binding.dart';
import 'package:homework4_2/route/route_name.dart';
import 'package:homework4_2/views/second_pages.dart';
import 'package:homework4_2/views/three_pages.dart';

import '../views/first_pages.dart';
import '../views/four_pages.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: RouteName.first,
        page: () => const FirstView(),
        binding: PagesBinding()),
    GetPage(
        name: RouteName.second,
        page: () => const SecondView(),
        binding: PagesBinding()),
    GetPage(
        name: RouteName.third,
        page: () => const ThreeView(),
        binding: PagesBinding()),
    GetPage(
        name: RouteName.fourth,
        page: () => const FourView(),
        binding: PagesBinding())
  ];
}
