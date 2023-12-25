import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skripsi/rekomendasi.dart';
import 'package:skripsi/signin.dart';

class NavDrawer extends StatelessWidget {
  static final storage = FlutterSecureStorage();

  Future<void> signOutAndNavigateToSignIn(BuildContext context) async {
    try {
      // Clear user credentials upon logout
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('isLoggedIn');

      // Clear other user-related data if needed

      await FirebaseAuth.instance.signOut();
      print("Signed Out");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset("assets/JAKEATS.png"),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/cover.jpg'),
              ),
            ),
          ),
          ListTile(
            title: Text('About'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Rekomendasi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRekomendasiView(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            iconColor: Colors.red,
            textColor: Colors.red,
            title: Text('Logout'),
            onTap: () => signOutAndNavigateToSignIn(context),
          ),
        ],
      ),
    );
  }
}
