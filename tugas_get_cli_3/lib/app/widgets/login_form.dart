import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../modules/home/controllers/login_controller.dart';
import '../themes/app_color.dart';
import '../themes/app_font.dart';
import '../utils/input_validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final formField = GlobalKey<FormState>();
    controller.isEmailInvalid.value = false;
    controller.isPassInvalid.value = false;
    return Form(
      key: formField,
      child: Column(
        children: [
          GetBuilder<LoginController>(
            builder: (_) => TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return InputValidator.emailMessageValidation(value, controller);
              },
              controller: controller.email,
              style: text14,
              focusNode: controller.emailNode,
              decoration: InputDecoration(
                hintText: "Masukkan email anda",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    "assets/svg/email.svg",
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        controller.emailNode.hasFocus
                            ? controller.isEmailInvalid.value
                                ? Colors.redAccent
                                : Colors.black
                            : const Color(0xFFA0A8B0),
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<LoginController>(
            builder: (_) => TextFormField(
              validator: (value) {
                return InputValidator.passMessageValidation(value, controller);
              },
              keyboardType: controller.isVisible.value
                  ? TextInputType.visiblePassword
                  : TextInputType.text,
              style: text14,
              controller: controller.pass,
              focusNode: controller.passNode,
              obscureText: !controller.isVisible.value,
              decoration: InputDecoration(
                hintText: "Masukkan password anda",
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.isVisible.toggle();
                    controller.update();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      controller.isVisible.value
                          ? "assets/svg/visible_pass.svg"
                          : "assets/svg/invisible_pass.svg",
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          controller.passNode.hasFocus
                              ? Colors.black
                              : const Color(0xFFA0A8B0),
                          BlendMode.srcIn),
                    ),
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    "assets/svg/password.svg",
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        controller.passNode.hasFocus
                            ? controller.isPassInvalid.value
                                ? Colors.redAccent
                                : Colors.black
                            : const Color(0xFFA0A8B0),
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Lupa Password?",
              style: text12.copyWith(color: secondaryColor),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor)),
              onPressed: controller.isLoading.value
                  ? () {}
                  : () async {
                      if (formField.currentState!.validate()) {
                        controller.login();
                      }
                    },
              child: GetBuilder<LoginController>(
                  builder: (_) => controller.isLoading.value
                      ? const Center(
                          child: SizedBox(
                            height: 19,
                            width: 19,
                            child: CircularProgressIndicator(
                              color: Colors.green,
                              strokeWidth: 2,
                            ),
                          ),
                        )
                      : Text(
                          "Login",
                          style: buttonText,
                        )),
            ),
          ),
        ],
      ),
    );
  }
}
