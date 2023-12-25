import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:skripsi/color/color_select.dart';
import 'package:skripsi/model/favorite_list_model.dart';

class Favorite extends StatefulWidget {
  const Favorite({
    Key? key,
    required this.numberList,
    required this.title,
  });

  final String title;

  final List<int> numberList;

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int activeIndex = 0;
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Page'),
      ),
    );
  }
}
