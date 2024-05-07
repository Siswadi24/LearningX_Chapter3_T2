import 'package:chapter10_mini_projek/app/widgets/register/form_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FF),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SvgPicture.asset('assets/svg/vektor_atas.svg',
                width: Get.width),
          ),
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
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Text(
              "Register Your Account",
              style:
                  GoogleFonts.nunito(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
          Positioned.fill(
            top: 150,
            left: 20,
            right: 20,
            child: AnimatedPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              duration: const Duration(milliseconds: 300),
              child: const SingleChildScrollView(
                child: RegisterForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
