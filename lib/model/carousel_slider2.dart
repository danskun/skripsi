import 'package:flutter/material.dart';
import 'package:skripsi/color/color_select.dart';
import 'package:skripsi/contentmakanan.dart';
import 'package:skripsi/favorite.dart';

class ContentMakanan2 extends StatefulWidget {
  // final String img;
  final String name;
  final String lokasi;
  final String jam;
  // final String rating;

  const ContentMakanan2({
    Key? key,
    // required this.img,
    required this.name,
    required this.lokasi,
    required this.jam,
    // required this.rating,
  }) : super(key: key);

  @override
  _ContentMakanan2State createState() => _ContentMakanan2State();
}

class _ContentMakanan2State extends State<ContentMakanan2> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ThirdScreen();
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorSelect.secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(15),
                //       topRight: Radius.circular(15),
                //     ),
                //   ),
                //   height: 200,
                //   width: double.maxFinite,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(15),
                //       topRight: Radius.circular(15),
                //     ),
                //     child: Image.asset(
                //       widget.img,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 145.0,
                  right: 5.0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        if (isFavorite) {}
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 30,
                          color: isFavorite
                              ? Colors.red.shade300
                              : Colors.blue.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5), // Mengurangi padding
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 14, // Mengurangi ukuran ikon
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      // Text(
                      //   widget.rating,
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 12, // Mengurangi ukuran teks
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(widget.lokasi),
                  ),
                  Container(
                    child: Text(widget.jam),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
