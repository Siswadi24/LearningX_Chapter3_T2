import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/login/controllers/login_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyB2r9-rWQFbmSo4S9_H9yk5e_7qOHHw75g",
        appId: "1:37262681762:android:f7e65b4f6f1e063196d9fb",
        messagingSenderId: "37262681762",
        projectId: "hahu-hoheng-fitfun"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(LoginController(), permanent: true);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot);
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute:
                  snapshot.data != null && snapshot.data!.emailVerified == true
                      ? Routes.HOME
                      : Routes.LOGIN,
              getPages: AppPages.routes,
              theme: ThemeData(
                primarySwatch: Colors.indigo,
              ),
            );
          }
          return const LoadingView();
        });
  }
}
