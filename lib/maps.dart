import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skripsi/navigation.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({
    Key? key,
  });

  final String gambar1 = 'assets/JAKEATS.png';

  @override
  State<MapsPage> createState() => _MapPageState();
}

const LatLng currentLocation = LatLng(-6.121435, 106.774124);
final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();

class _MapPageState extends State<MapsPage> {
  int activeIndex = 0;
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          child: Image.asset(
            widget.gambar1,
            height: 100,
            width: 100,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          // Your implementation here
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(-6.121435, 106.774124),
          zoom: 11.0,
        ),
      ),
    );
  }
}
