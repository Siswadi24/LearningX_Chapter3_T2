import 'package:chapter5_tugas1/app/themes/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../widgets/home/card_list_restaurant.dart';
import '../../../widgets/home/search_form.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SearchForm(),
            20.verticalSpace,
            Text(
              "Restaurant List API",
              style: text19.copyWith(fontWeight: FontWeight.w700),
            ).paddingSymmetric(horizontal: 20.w),
            20.verticalSpace,
            const CardListRestaurant()
          ],
        ),
      ),
    );
  }
}
