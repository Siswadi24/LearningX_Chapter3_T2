import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      builder: (_) => Scaffold(
        backgroundColor: const Color(0xFFEEF2FF),
        body: Stack(
          children: [
            Positioned(
              top: 90,
              left: -20,
              child: SvgPicture.asset('assets/svg/splash1.svg'),
            ),
            Positioned(
              top: 0,
              right: -20,
              child: SvgPicture.asset('assets/svg/splash2.svg'),
            ),
            Positioned(
              bottom: -100,
              left: 0,
              child: SvgPicture.asset('assets/svg/splash_bottom1.svg'),
            ),
            Positioned(
              bottom: -100,
              child: SvgPicture.asset('assets/svg/splash_bottom2.svg'),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/bunga_ungu.png'),
                  Text(
                    'HELLO FELLAS.',
                    style: GoogleFonts.nunito(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Temukan segala jenis bunga',
                    style: GoogleFonts.nunito(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    ' dari berbagai belahan dunia!',
                    style: GoogleFonts.nunito(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
