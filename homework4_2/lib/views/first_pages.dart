import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pages_controllers.dart';
import '../route/route_name.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PagesControllers>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('First View'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.second);
              },
              child: const Text('Go to Second Page'),
            ),
            ElevatedButton(
              onPressed: () {
                _showOptionsDialog(context, controller);
              },
              child: const Text('Change Text'),
            ),
            const SizedBox(height: 30),
            Obx(() => Text(controller.text.value)),
          ],
        ),
      ),
    );
  }

  void _showOptionsDialog(BuildContext context, PagesControllers controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ganti Text'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  controller.toggleCase(true);
                },
                child: const Text('Uppercase'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  controller.toggleCase(false);
                },
                child: const Text('Lowercase'),
              ),
            ],
          ),
        );
      },
    );
  }
}
