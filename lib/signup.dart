import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skripsi/color/color_utils.dart';
import 'package:skripsi/homepage.dart';
import 'package:skripsi/reusable_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              hexStringColor("005b96"),
              hexStringColor("011f4b"),
              hexStringColor("00008B ")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              1.0,
              0.5,
              1.0
            ], // You can adjust the stops for more control over color distribution
            tileMode: TileMode.clamp,
          )),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      "Username", Icons.person, false, _usernameTextController),
                  const SizedBox(
                    height: 15,
                  ),
                  reusableTextField(
                      "Email", Icons.email, false, _emailTextController),
                  const SizedBox(
                    height: 15,
                  ),
                  reusableTextField(
                      "Password", Icons.lock, true, _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  signInSignUpButton(context, false, () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("Created New Account");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                    title: "",
                                  )));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString}");
                    });
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
