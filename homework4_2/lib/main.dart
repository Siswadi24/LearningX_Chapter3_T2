import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework4_2/route/route.dart';

import 'bindings/pages_binding.dart';
import 'views/first_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Learn Get X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppPages.pages,
      initialBinding: PagesBinding(),
      home: const FirstView(),
    );
  }
}
