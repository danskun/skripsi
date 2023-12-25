import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skripsi/FiltersPage.dart';
import 'package:skripsi/color/color_select.dart';
import 'package:skripsi/model/carousel_slider.dart';
import 'package:skripsi/model/carousel_slider2.dart';
import 'package:skripsi/navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  });

  final String title;
  final String gambar1 = 'assets/JAKEATS.png';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<QuerySnapshot> getRestaurants() {
    return FirebaseFirestore.instance.collection('restaurant').get();
  }

  int activeIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: NavDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor:
            Colors.white, // Mengubah warna latar belakang AppBar menjadi biru
        title: SizedBox(
          child: Image.asset(
            widget.gambar1,
            height: 100,
            width: 100,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Container(
              // Use a Material design search bar
              child: TextField(
                controller: _searchController,
                onChanged: (text) {
                  setState(() {
                    // Menetapkan isSearching ke true jika teks ada, atau false jika teks kosong
                    isSearching = text.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  // Add a search icon or button to the search bar
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                  // Menggunakan kondisi untuk menampilkan atau menyembunyikan tombol "Clear"
                  suffixIcon: isSearching
                      ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              // Membersihkan teks dan menonaktifkan isSearching
                              _searchController.clear();
                              isSearching = false;
                            });
                          },
                        )
                      : IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FiltersPage()),
                            );
                          },
                          icon: Icon(Icons.filter_list),
                        ), // Mengembalikan null jika tidak ada teks
                  filled: true,
                  fillColor: ColorSelect.secondaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Menambahkan jarak antara search bar dan judul

            Text(
              'Rekomendasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<QuerySnapshot>(
                future: getRestaurants(),
                builder: (context, snapshot) {
                  List<ContentMakanan> carouselItems = [];

                  if (snapshot.hasData) {
                    final restaurants = snapshot.data?.docs.toList();
                    carouselItems = restaurants
                            ?.map((restaurant) => ContentMakanan(
                                  name: restaurant['name'],
                                  lokasi: restaurant['lokasi'],
                                  jam: restaurant['jam'],
                                  // rating: restaurant['rating'],
                                ))
                            .toList() ??
                        [];
                  }

                  return ListView(
                    children: [
                      CarouselSlider(
                        items: carouselItems,
                        options: CarouselOptions(
                          height: 330.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 4),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          aspectRatio: 16 / 9,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.8,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            SizedBox(
              height: 20,
            ),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: 3,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Daftar Makanan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // CarouselSlider(
            //   items: [
            //     ContentMakanan2(
            //       img: 'assets/warteg.png',
            //       name: "tes1",
            //       lokasi: "tes2",
            //       jam_buka: "tes3",
            //       rating: '4.0',
            //     ),
            //     ContentMakanan2(
            //       img: "assets/warteg.png",
            //       name: "tes1",
            //       lokasi: "tes2",
            //       jam_buka: "tes3",
            //       rating: '4.0',
            //     ),
            //   ],
            //   options: CarouselOptions(
            //     height: 340.0,
            //     enlargeCenterPage: true,
            //     aspectRatio: 16 / 9,
            //     enableInfiniteScroll: false,
            //     viewportFraction: 0.9,
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
