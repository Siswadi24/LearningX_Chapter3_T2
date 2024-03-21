import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${Get.arguments} Detail'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.getDetailRestaurant(Get.arguments),
            builder: (_, snapshot) {
              var detailRestaurant = snapshot.data?.meals;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: detailRestaurant?.length,
                    itemBuilder: (_, index) {
                      //Membuat List Gambar yang didalamnya menggunakan Text dan Terletak di bagian bawah
                      return Stack(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl:
                                detailRestaurant![index].strMealThumb ?? '',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.black54,
                              child: Text(
                                detailRestaurant[index].strMeal,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              } else {
                return const Center(child: Text('Maaf Data Tidak Ditemukan'));
              }
            }));
  }
}
