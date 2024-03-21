import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/model/restaurant_model.dart';
import '../../modules/home/controllers/home_controller.dart';

class CardListRestaurant extends StatelessWidget {
  const CardListRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Flexible(
      child: FutureBuilder<ListRestoransModel>(
          future: controller.getRestaurantModel(),
          builder: (_, snapshot) {
            var dataRestaurant = snapshot.data?.categories;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.h,
                      crossAxisSpacing: 5.w,
                      childAspectRatio: 0.8),
                  shrinkWrap: true,
                  itemCount: dataRestaurant?.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () async {
                        await Get.toNamed('/detailRest-view',
                            arguments: dataRestaurant?[index].strCategory);
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CachedNetworkImage(
                                imageUrl:
                                    "${dataRestaurant?[index].strCategoryThumb}",
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error)),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 10),
                              child: Text(
                                "${dataRestaurant?[index].strCategory}",
                                style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Text(
                                  "${dataRestaurant?[index].strCategoryDescription}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).paddingOnly(left: 10.w, right: 10.w),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(child: Text("Maaf Tidak Terdapat Data"));
            }
          }),
    );
  }
}
