import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/bottom_section.dart';
import '../../../widgets/login_form.dart';

class LoginView extends GetView {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Login",
                    // style: text28,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // SvgPicture.asset(
                  //   "assets/svg/logo.svg",
                  //   height: 50,
                  // ),
                  SizedBox(
                    height: 50,
                  ),
                  LoginForm(),
                  SizedBox(
                    height: 20,
                  ),
                  LoginBottomSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
