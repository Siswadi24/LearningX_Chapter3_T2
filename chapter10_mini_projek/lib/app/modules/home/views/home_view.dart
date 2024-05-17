import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/home/tombol_upload_foto.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FF),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              'assets/svg/vektor_bawahKiri.svg',
              width: Get.width,
            ),
          ),
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              'assets/svg/vektor_bawahKanan.svg',
              width: Get.width,
            ),
          ),
          StreamBuilder<DocumentSnapshot?>(
            stream: controller.getActiveUserStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return const Center(child: Text('No active user found'));
              }

              var userData = snapshot.data!.data() as Map<String, dynamic>;
              controller.namaUser.value = userData['name'] ?? 'Unknown';
              controller.noPhoneUser.value = userData['phone'] ?? 'N/A';
              controller.alamatUser.value = userData['address'] ?? 'N/A';

              return Positioned(
                top: 50,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Hello, ${controller.namaUser.value}",
                          style: GoogleFonts.nunito(
                              fontSize: 30, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(width: 50),
                        //Membuat dan menampilkan foto profil
                        Obx(
                          () => controller.images.value.isEmpty
                              ? const CircleAvatar(
                                  radius: 30,
                                  child: Icon(Icons.person),
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(controller.images.value),
                                  // child: Image.network(
                                  //   controller.images.value,
                                  //   height: 50,
                                  //   width: 50,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                        ),
                      ],
                    ),
                    const Text('How\'s your day going?'),
                    SvgPicture.asset(
                      'assets/svg/line.svg',
                      width: Get.width,
                      height: 30,
                    ),
                    Text(
                      'My Phone Number : ${controller.noPhoneUser.value}',
                      style: GoogleFonts.nunito(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'My Address : ${controller.alamatUser.value}',
                      style: GoogleFonts.nunito(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              );
            },
          ),
          const Positioned(
            // top: 150,
            bottom: 250,
            left: 20,
            right: 20,
            child: TombolUploadFoto(),
          ),
        ],
      ),
    );
  }
}
