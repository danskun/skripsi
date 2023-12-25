import 'package:flutter/material.dart';
import 'package:skripsi/favorite.dart';
import 'package:skripsi/homepage.dart';
import 'package:skripsi/maps.dart';
import 'package:skripsi/profile.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    MyHomePage(
      title: 'Home',
    ), // Ganti ini dengan tampilan Home Anda
    // Ganti ini dengan tampilan Search Anda
    MapsPage(),
    Favorite(
      title: 'favorite',
      numberList: [],
    ),
    // Ganti ini dengan tampilan Profile Anda
    Profile(
      title: 'Profile',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 30, 128, 219),
        unselectedItemColor: Colors.blue.shade300,
        onTap: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
