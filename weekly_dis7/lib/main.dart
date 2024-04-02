import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatShaapp'),
          backgroundColor: Colors.green[800],
          bottom: const TabBar(
            tabs: [
              Text('CHAT'),
              Text('STATUS'),
              Text('PANGGILAN'),
            ],
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.white,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.camera_alt, color: Colors.grey[400]),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.grey[400]),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.grey[400]),
            ),
          ],
        ),
        body: TabBarView(children: [
          //Membuat Chat View
          Center(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, index) {
                return const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                  ),
                  title: Text(
                    'Joko',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text('Hello World'),
                );
              },
            ),
          ),

          //Membuat Status View
          Center(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (_, index) {
                  //Membuat Status View
                  if (index == 0) {
                    // Tampilkan item untuk menambahkan status baru
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            'Tambah Status',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                          title: const Text('Tambahkan status baru'),
                          onTap: () {
                            // Aksi ketika menambahkan status baru
                          },
                        ),
                      ],
                    );
                  } else {
                    //Membuat Update Status View
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            'Status Update',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height:
                              100, // Sesuaikan tinggi container sesuai kebutuhan
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              String imageUrl =
                                  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';
                              return Container(
                                margin: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(imageUrl),
                                    ),
                                    const Text('Dana'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ),

          //Membuat Panggilan View
          Center(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                    ),
                    title: const Text(
                      'Joko',
                    ),
                    subtitle: const Row(
                      children: [
                        Icon(
                          Icons.call_received,
                          size: 13,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5),
                        Text('Hari ini 03.01')
                      ],
                    ),
                    trailing: Icon(Icons.call, color: Colors.grey[600]),
                    onTap: () {},
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
