import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route/route_name.dart';

class ThreeView extends StatelessWidget {
  const ThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Three View'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.fourth);
              },
              child: const Text('Go to Four Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                      title: const Text('Dialog'),
                      content: const Text('Hello'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('OK'))
                      ]),
                );
              },
              child: const Text('Tampilkan Text Dialog'),
            )
          ],
        ),
      ),
    );
  }
}
