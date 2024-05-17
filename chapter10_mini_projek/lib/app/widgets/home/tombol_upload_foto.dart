import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modules/home/controllers/home_controller.dart';

class TombolUploadFoto extends StatelessWidget {
  const TombolUploadFoto({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          child: ElevatedButton(
            onPressed: () async {
              controller.uploadAndDisplayImage();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD567CD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: GetBuilder<HomeController>(
              builder: (_) => Text(
                "Upload Foto",
                style: GoogleFonts.nunito(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        SizedBox(
          width: Get.width,
          child: ElevatedButton(
            onPressed: () {
              controller.logout(controller.namaUser.value);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 238, 32, 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: GetBuilder<HomeController>(
              builder: (_) => Text(
                "Log Out",
                style: GoogleFonts.nunito(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
