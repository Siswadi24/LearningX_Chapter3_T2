import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route/route_name.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second View'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.third);
              },
              child: const Text('Go to Third Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Title",
                  "Message",
                  icon: const Icon(Icons.add),
                );
              },
              child: const Text('Tampilkan Snack Bar'),
            )
          ],
        ),
      ),
    );
  }
}
