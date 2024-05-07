import 'package:chapter10_mini_projek/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
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
            width: Get.width,
            height: 50,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4D4D4), width: 1.0),
            ),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
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
            width: Get.width,
            height: 50,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4D4D4), width: 1.0),
            ),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
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
            width: Get.width,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4D4D4)),
            ),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
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
            width: Get.width,
            height: 50,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4D4D4)),
            ),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
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
            width: Get.width,
            height: 50,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4D4D4)),
            ),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
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
            width: Get.width,
            height: 50,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD4D4D4)),
            ),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
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
          )
        ],
      ),
    );
  }
}
