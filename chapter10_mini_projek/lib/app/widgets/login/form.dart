import 'package:chapter10_mini_projek/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/input_validator.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final formField = GlobalKey<FormState>();
    return Form(
      key: formField,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username",
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          const SizedBox(height: 5),
          Container(
            // width: Get.width,
            // height: 50,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4D4D4), width: 1.0),
            ),
            child: GetBuilder<LoginController>(
              builder: (_) => TextFormField(
                controller: controller.usernameController,
                validator: (value) {
                  return InputValidator.usernameMessageValidation(
                      value, controller);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  isDense: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.colorScheme.background,
                      // width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.colorScheme.background,
                      width: 1,
                    ),
                  ),
                  hintText: "Enter Your Username",
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Password",
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          Container(
            // width: Get.width,
            // height: 50,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4D4D4)),
            ),
            child: GetBuilder<LoginController>(
              builder: (_) => TextFormField(
                controller: controller.passwordController,
                validator: (value) {
                  return InputValidator.passMessageValidation(
                      value, controller);
                },
                obscureText: controller.isObsecure,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isObsecure = !controller.isObsecure;
                      controller.update();
                    },
                    icon: controller.isObsecure
                        ? SvgPicture.asset(
                            "assets/svg/eye.svg",
                          )
                        : SvgPicture.asset(
                            "assets/svg/eyeSlash.svg",
                          ),
                  ),
                  isDense: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.colorScheme.background,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.colorScheme.background,
                      width: 1,
                    ),
                  ),
                  hintText: "Enter Your Password",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? () {}
                    : () async {
                        if (formField.currentState!.validate()) {
                          controller.login(controller.usernameController.text,
                              controller.passwordController.text);
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD567CD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: GetBuilder<LoginController>(
                  builder: (_) => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Login",
                          style: GoogleFonts.nunito(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
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
    );
  }
}
