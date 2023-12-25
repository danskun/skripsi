import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRekomendasiController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController lokasiC;
  late TextEditingController jamC;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addRekomendasi(String name, String lokasi, String jam) async {
    CollectionReference restaurant = firestore.collection("restaurant");
    // GetMaterialApp;
    try {
      await restaurant.add({
        "name": name,
        "lokasi": lokasi,
        "jam": jam,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan tempat",
        onConfirm: () {
          nameC.clear();
          lokasiC.clear();
          jamC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "nice",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Ada Kesalahan",
        middleText: "Tidak Berhasil menambahkan tempat",
      );
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    lokasiC = TextEditingController();
    jamC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    lokasiC.dispose();
    jamC.dispose();
    super.onClose();
  }
}
