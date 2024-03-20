import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../modules/home/controllers/signup_controller.dart';
import '../../themes/app_color.dart';
import '../../themes/app_font.dart';
import '../../utils/input_validator.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
    final formField = GlobalKey<FormState>();
    return Form(
      key: formField,
      child: Column(
        children: [
          GetBuilder<SignupController>(
              builder: (_) => TextFormField(
                    validator: (value) =>
                        InputValidator.nameMessageValidation(value, controller),
                    controller: controller.name,
                    style: text14,
                    focusNode: controller.nameNode,
                    decoration: InputDecoration(
                        hintText: "Masukkan nama lengkap anda",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(
                            "assets/svg/person.svg",
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                controller.nameNode.hasFocus
                                    ? controller.isNameInvalid.value
                                        ? Colors.redAccent
                                        : Colors.black
                                    : const Color(0xFFA0A8B0),
                                BlendMode.srcIn),
                          ),
                        )),
                  )),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<SignupController>(
              builder: (_) => TextFormField(
                    validator: (value) => InputValidator.emailMessageValidation(
                        value, controller),
                    keyboardType: TextInputType.emailAddress,
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
                        )),
                  )),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<SignupController>(
            builder: (_) => TextFormField(
              validator: (value) =>
                  InputValidator.passMessageValidation(value, controller),
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
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RichText(
              text: TextSpan(
                  style: text12.copyWith(color: const Color(0xFF717784)),
                  children: const [
                    TextSpan(
                      text: "By continuing you accept our",
                    ),
                    TextSpan(
                      text: " Privacy Policy ",
                      style: TextStyle(color: secondaryColor),
                    ),
                    TextSpan(
                      text: " and The",
                    ),
                    TextSpan(
                      text: " terms of Use",
                      style: TextStyle(color: secondaryColor),
                    ),
                  ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              onPressed: controller.isLoading.value
                  ? () {}
                  : () async {
                      if (formField.currentState!.validate()) {
                        controller.register();
                      }
                    },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor)),
              child: GetBuilder<SignupController>(
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
                          "Sign Up",
                          style: buttonText,
                        )),
            ),
          )
        ],
      ),
    );
  }
}
