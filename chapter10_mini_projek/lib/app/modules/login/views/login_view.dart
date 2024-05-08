import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/login/form.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Menaruh gambar vektor untuk latar belakang di bagian paling atas
            SvgPicture.asset(
              'assets/svg/vektor_atas.svg',
              width: Get.width,
            ),
            const SizedBox(height: 30),
            //Menaruh logo pada bagian tengah
            Container(
              width: Get.width,
              height: Get.height * 0.3,
              alignment: Alignment.center,
              child: Image.asset('assets/images/image.png'),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Welcome To Azalea",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FormWidget(),
            ),

            Stack(
              children: [
                SvgPicture.asset(
                  'assets/svg/vektor_bawahKiri.svg',
                  width: Get.width,
                ),
                Positioned(
                  bottom: 0,
                  child: SvgPicture.asset(
                    'assets/svg/vektor_bawahKanan.svg',
                    width: Get.width,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
