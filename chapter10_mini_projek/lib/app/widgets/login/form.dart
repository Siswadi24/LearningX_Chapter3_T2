import 'package:chapter10_mini_projek/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormWidget extends StatelessWidget {
  final String title;
  final String hint;

  final Widget? widget;
  const FormWidget(
      {super.key, required this.title, required this.hint, this.widget});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            padding: const EdgeInsets.only(left: 5),
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFD4D4D4),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Row(
              children: [
                Expanded(
                  child: GetBuilder<LoginController>(
                    builder: (_) => TextFormField(
                      obscureText:
                          title == "Password" ? controller.isObsecure : false,
                      readOnly: widget == null ? false : true,
                      autofocus: false,
                      cursorColor:
                          Get.isDarkMode ? Colors.grey[200] : Colors.grey[700],
                      // controller: controller,
                      // style: subTitleStyle,
                      decoration: InputDecoration(
                        isDense: true,
                        suffixIcon: title == "Password"
                            ? IconButton(
                                onPressed: () {
                                  controller.isObsecure =
                                      !controller.isObsecure;
                                  controller.update();
                                },
                                icon: controller.isObsecure
                                    ? SvgPicture.asset(
                                        "assets/svg/eye.svg",
                                      )
                                    : SvgPicture.asset(
                                        "assets/svg/eyeSlash.svg",
                                      ),
                              )
                            : null,
                        hintText: hint,
                        // hintStyle: subTitleStyle,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: context.theme.colorScheme.background,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.theme.colorScheme.background,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
