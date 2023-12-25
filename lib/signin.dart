import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skripsi/color/color_select.dart';
import 'package:skripsi/color/color_utils.dart';
import 'package:skripsi/homepage.dart';
import 'package:skripsi/main.dart';
import 'package:skripsi/reusable_widget.dart';
import 'package:skripsi/signup.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  Future<void> checkUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userEmail = prefs.getString('userEmail');
    String? userPassword = prefs.getString('userPassword');

    if (userEmail != null && userPassword != null) {
      // Attempt to sign in with stored credentials
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword)
          .then((value) {})
          .catchError((error) {
        print("Error: $error");
      });
    }
  }

  Future<void> saveUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            stops: [1.0, 0.5, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.1,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/JAKEATS.png"),
                SizedBox(
                  height: 10,
                ),
                reusableTextField(
                  "Enter Username",
                  Icons.person_outlined,
                  false,
                  _emailTextController,
                ),
                SizedBox(
                  height: 10,
                ),
                reusableTextField(
                  "Enter Password",
                  Icons.lock,
                  true,
                  _passwordTextController,
                ),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () async {
                  // Check if email and password are not empty
                  if (_emailTextController.text.isNotEmpty &&
                      _passwordTextController.text.isNotEmpty) {
                    // Attempt to sign in
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      );

                      // Save user credentials for persistent login
                      await saveUserCredentials();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage2(title: ''),
                        ),
                      );
                    } catch (error) {
                      setState(() {
                        // Set error message for display
                        _errorMessage = "Error: $error";
                      });
                      print("Error: $error");
                    }
                  } else {
                    setState(() {
                      // Set error message for display
                      _errorMessage = "Email and password cannot be empty.";
                    });
                  }
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't Have Account?",
            style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
