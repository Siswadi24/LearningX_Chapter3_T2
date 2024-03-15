import 'package:get/get.dart';

import '../controllers/pages_controllers.dart';

class PagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PagesControllers>(() => PagesControllers());
  }
}
