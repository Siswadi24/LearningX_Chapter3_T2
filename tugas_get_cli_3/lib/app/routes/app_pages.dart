import 'package:get/get.dart';
import 'package:tugas_get_cli_3/app/modules/home/bindings/home_binding.dart';
import 'package:tugas_get_cli_3/app/modules/home/bindings/login_binding.dart';
import 'package:tugas_get_cli_3/app/modules/home/bindings/register_binding.dart';
import 'package:tugas_get_cli_3/app/modules/home/views/home_view.dart';
import 'package:tugas_get_cli_3/app/modules/home/views/login_view.dart';
import 'package:tugas_get_cli_3/app/modules/home/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static const REGISTER = Routes.REGISTER;
  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
