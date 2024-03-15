import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route/route_name.dart';

class FourView extends StatelessWidget {
  const FourView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Four View'),
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
                Get.bottomSheet(
                  _buildBottomSheet(context),
                );
              },
              child: const Text('Menampilkan Buttom Sheets'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text('Option 1'),
            onTap: () {
              // Handle option 1
              Get.back();
            },
          ),
          ListTile(
            title: const Text('Option 2'),
            onTap: () {
              // Handle option 2
              Get.back();
            },
          ),
          ListTile(
            title: const Text('Cancel'),
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
