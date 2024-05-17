import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../login/views/login_view.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final image = XFile("").obs;
  RxString images = ''.obs;
  RxString namaUser = ''.obs;
  RxString noPhoneUser = ''.obs;
  RxString alamatUser = ''.obs;
  RxBool isLoading = false.obs;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  void setUsername(String username) async {
    await firestore.collection('users').doc(username).update({'isLogin': true});
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';

    if (username.isNotEmpty) {
      DocumentSnapshot docSnapshot =
          await firestore.collection('users').doc(username).get();
      if (docSnapshot.exists) {
        var userData = docSnapshot.data() as Map<String, dynamic>;
        namaUser.value = userData['name'] ?? 'Unknown';
        noPhoneUser.value = userData['phone'] ?? 'N/A';
        alamatUser.value = userData['address'] ?? 'N/A';
      } else {
        print('User document not found.');
      }
    }
  }

  Stream<DocumentSnapshot?> getActiveUserStream() {
    return firestore
        .collection('users')
        .where('isLogin', isEqualTo: true)
        .snapshots()
        .map((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first;
      } else {
        // Mengembalikan null jika tidak ada user yang aktif
        return null;
      }
    });
  }

  void getActiveUserData() async {
    try {
      isLoading.value = true;
      QuerySnapshot activeUsersSnapshot = await firestore
          .collection('users')
          .where('isLogin', isEqualTo: true)
          .get();

      if (activeUsersSnapshot.docs.isNotEmpty) {
        DocumentSnapshot activeUserDoc = activeUsersSnapshot.docs.first;
        Map<String, dynamic> userData =
            activeUserDoc.data() as Map<String, dynamic>;
        namaUser.value = userData['name'];
        noPhoneUser.value = userData['phone'];
        alamatUser.value = userData['address'];
        update();
      }
    } catch (e) {
      print('Error fetching active user data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void logout(String username) async {
    try {
      DocumentReference docRef = firestore.collection('users').doc(username);
      DocumentSnapshot docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        await docRef.update({'isLogin': false});
        Get.off(() => const LoginView());
      } else {
        print('User document not found.');
      }
    } catch (e) {
      print('Error logging out: $e');
    } finally {
      // Clear username from Shared Preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('username');
    }
  }

  //fungsi ini akan digunakan untuk mendapatkan gambar dari penyimpanan local handpone
  Future getImage(bool gallery) async {
    //deklarasikan picker
    ImagePicker picker = ImagePicker();
    XFile? pickedFile;
    // Let user select photo from gallery
    if (gallery) {
      pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
    }
    // Otherwise open camera to get new photo
    else {
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );
    }
    //jika user memilih sebuah gambar maka pickedfile di assign kedalam image variable
    if (pickedFile != null) {
      image.value = pickedFile;
    }
  }

  //method ini digunakan untuk mengupload file foto yang diambil ke dalam cloud_storage
  //akan mengembalikan string berupa path dari foto yang diupload di cloud_storage
  Future<String> uploadFile(File image) async {
    final storageReference = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Menus/${image.path}');
    await storageReference.putFile(image);
    String returnURL = "";
    await storageReference.getDownloadURL().then(
      (fileURL) {
        returnURL = fileURL;
      },
    );
    return returnURL;
  }

  //method ini digunakan untuk menyimpan gambar dan mengupload gambar
  Future<void> saveImages(
    File images,
  ) async {
    //tampilkan loading indicator
    Get.bottomSheet(
      Container(
          height: 80,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularProgressIndicator(),
              Text("Loading"),
            ],
          )),
    );
    //upload file ke cloud_storage dan simpan pada imageURL
    String imageURL = await uploadFile(images);
    final refDoc = ref.doc();
    //simpan url gambar yang sudah diuplod
    final data = {"id": refDoc.id, "images": imageURL};
    refDoc.set(data);
    Get.back();
  }

  Future<void> uploadAndDisplayImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      try {
        if (images.value.isNotEmpty) {
          await firebase_storage.FirebaseStorage.instance
              .refFromURL(images.value)
              .delete();
        }

        String imageName = DateTime.now().millisecondsSinceEpoch.toString();
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('images')
            .child('$imageName.jpg');
        await ref.putFile(imageFile);

        String downloadUrl = await ref.getDownloadURL();

        images.value = downloadUrl;
        Get.snackbar(
          'Upload Berhasil',
          'Gambar berhasil diupload',
          backgroundColor: const Color.fromARGB(255, 245, 95, 145),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('No image selected.');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getActiveUserData();
  }
}
