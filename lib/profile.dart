import 'package:flutter/material.dart';
import 'package:skripsi/navigation.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.title});

  final String title;
  final String gambar1 = 'assets/JAKEATS.png';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int activeIndex = 0;
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [Text('User id')],
      ),
    );
  }
}
