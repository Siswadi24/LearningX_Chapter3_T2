import 'package:chapter10_mini_projek/app/modules/register/controllers/register_controller.dart';
import 'package:chapter10_mini_projek/app/utils/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
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
            child: GetBuilder<RegisterController>(
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
            "Name",
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
              border: Border.all(color: const Color(0xFFD4D4D4), width: 1.0),
            ),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                validator: (value) {
                  return InputValidator.nameMessageValidation(
                      value, controller);
                },
                controller: controller.nameController,
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
                  hintText: "Enter Your Name",
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Address",
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          Container(
            // width: Get.width,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4D4D4)),
            ),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                controller: controller.addressController,
                validator: (value) {
                  return InputValidator.addressMessageValidation(
                      value, controller);
                },
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
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
                  hintText: "Enter Your Adress",
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Phone Number",
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
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                controller: controller.phoneController,
                validator: (value) {
                  return InputValidator.phoneMessageValidation(
                      value, controller);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
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
                  hintText: "Enter Your Phone Number",
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
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                controller: controller.passwordController,
                validator: (value) {
                  return InputValidator.passMessageValidation(
                      value, controller);
                },
                obscureText: controller.isObsecureRegister,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isObsecureRegister =
                          !controller.isObsecureRegister;
                      controller.update();
                    },
                    icon: controller.isObsecureRegister
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
          const SizedBox(height: 10),
          Text(
            "Confirm Password",
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
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                controller: controller.confirmPasswordController,
                validator: (value) {
                  //validation confirm pass
                  return InputValidator.confirmPassMessageValidation(
                      value, controller);
                },
                obscureText: controller.isObsecureRegister,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isObsecureRegister =
                          !controller.isObsecureRegister;
                      controller.update();
                    },
                    icon: controller.isObsecureRegister
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
                  hintText: "Enter Your Confirm Password",
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
                          controller.register(
                              controller.usernameController.text,
                              controller.nameController.text,
                              controller.addressController.text,
                              controller.phoneController.text,
                              controller.passwordController.text,
                              controller.confirmPasswordController.text);
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD567CD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: GetBuilder<RegisterController>(
                  builder: (_) => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Register",
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
                      onTap: () => Get.toNamed('/login'),
                      child: Text(
                        "Log in",
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
