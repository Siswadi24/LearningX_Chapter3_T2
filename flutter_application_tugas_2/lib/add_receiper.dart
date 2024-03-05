import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddReceipeForm extends StatefulWidget {
  const AddReceipeForm({super.key});

  @override
  State<AddReceipeForm> createState() => _AddReceipeFormState();
}

class _AddReceipeFormState extends State<AddReceipeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Receipe'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                child: const Text('Close'),
                onTap: () {
                  print('close');
                }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.red,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Super Cool You'are creating a new receipe!",
                      style: TextStyle(color: Colors.white)),
                  Text("Let's Get Started",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Give Your Receipe A Name'),
                  const TextField(
                    decoration: InputDecoration(hintText: 'Masukan Nama Menu'),
                  ),
                  const SizedBox(height: 20),
                  const Text('Estimasi Waktu Memasak (menit)'),
                  const TextField(
                    decoration:
                        InputDecoration(hintText: 'Masukan Waktu Pembuatan'),
                  ),
                  const SizedBox(height: 20),
                  const Text('Deskripsi'),
                  const TextField(
                    maxLines: 5,
                    decoration: InputDecoration(hintText: 'Masukan Deskripsi'),
                  ),
                  const SizedBox(height: 20),
                  const Text('Resep, Bahan, dan Langkah'),
                  const TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: 'Masukan Recep dan Cara Pembuatan'),
                  ),
                  const SizedBox(height: 20),
                  //tolong Buatlah button add resep dan letakkan di paling bawah
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        print('save menu');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white),
                      child: const Text('Add Menu'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
