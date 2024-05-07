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
            const FormWidget(
              title: 'Username',
              hint: 'Enter Your Username',
              // controller: _passwordController,
            ),
            const FormWidget(
              title: 'Password',
              hint: 'Enter Your Password',
              // controller: _passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD567CD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // onPressed: controller.isLoading.value
                  //     ? () {}
                  //     : () async {
                  //         // if (formField.currentState!.validate()) {
                  //         //   await controller.signUp();
                  //         }
                  //       },
                  child: Text(
                    "LogIn",
                    style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don’t have an account ?",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        const WidgetSpan(
                          child: SizedBox(width: 5),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                            onTap: () => Get.toNamed('/register'),
                            child: Text(
                              "Sign in",
                              style: GoogleFonts.nunito(
                                  color: const Color(0xFF0094FF), fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
