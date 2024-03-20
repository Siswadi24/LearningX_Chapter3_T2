import 'package:get/get.dart';
import 'package:tugas_get_cli_3/app/modules/home/controllers/signup_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
