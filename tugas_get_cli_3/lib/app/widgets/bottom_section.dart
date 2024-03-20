import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../modules/home/controllers/login_controller.dart';
import '../themes/app_color.dart';
import '../themes/app_font.dart';

class LoginBottomSection extends StatelessWidget {
  const LoginBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Column(
      children: [
        RichText(
          text: TextSpan(
              style: text14.copyWith(color: const Color(0xFF717784)),
              children: [
                const TextSpan(
                  text: "Belum punya akun?",
                ),
                const WidgetSpan(
                    child: SizedBox(
                  width: 5,
                )),
                WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: GestureDetector(
                      onTap: () => Get.toNamed('/register-view'),
                      child: const Text(
                        "Daftar",
                        style: TextStyle(color: secondaryColor),
                      ),
                    )),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 1,
                    color: const Color(0xFFE5E7EB),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "OR",
                  style: text14.copyWith(color: Colors.grey),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 1,
                    color: const Color(0xFFE5E7EB),
                  )),
            ],
          ),
        ),
        Text(
          "Continue with",
          style: text14.copyWith(color: Colors.grey),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: controller.loginWithImages
              .map<Widget>((image) => SizedBox(
                    height: 45,
                    width: 55,
                    child: Stack(children: [
                      Container(
                        height: 45,
                        width: 55,
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: shadowColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: SvgPicture.asset(
                          image,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () {},
                        ),
                      )
                    ]),
                  ))
              .toList(),
        )
      ],
    );
  }
}
