import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi/model/rekomendasi_controller.dart';

class AddRekomendasiView extends GetView<AddRekomendasiController> {
  final AddRekomendasiController controller =
      Get.put(AddRekomendasiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REKOMENDASI"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.nameC,
              autocorrect: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Nama Tempat",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.lokasiC,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Lokasi",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.jamC,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Jam Buka",
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () => controller.addRekomendasi(
                    controller.nameC.text,
                    controller.lokasiC.text,
                    controller.jamC.text),
                child: Text("add tempat"))
          ],
        ),
      ),
    );
  }
}
