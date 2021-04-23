import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/routes/route_names.dart';
import 'package:flutterscainitiativeproject/screens/home_screen.dart';
import 'package:flutterscainitiativeproject/shared/constants.dart';
import 'package:flutterscainitiativeproject/shared/widgets/button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String firstName;
  String lastName;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1,
                  tileMode: TileMode.repeated,
                  stops: [
                0.3,
                1,
              ],
                  colors: [
                Colors.white,
                Colors.lightGreenAccent.withOpacity(0.6)
              ])),
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset("assets/images/myRecipeLogo.png"),
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              TextField(
                                textAlign: TextAlign.center,
                                decoration: kTextFieldDecoration.copyWith(
                                    hintText: "Enter your First Name"),
                                onChanged: (value) {
                                  firstName = value;
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              TextField(
                                textAlign: TextAlign.center,
                                decoration: kTextFieldDecoration.copyWith(
                                    hintText: "Enter your Last Name"),
                                onChanged: (value) {
                                  lastName = value;
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.center,
                                decoration: kTextFieldDecoration.copyWith(
                                    hintText: "Enter your Email"),
                                onChanged: (value) {
                                  email = value;
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              TextField(
                                obscureText: true,
                                textAlign: TextAlign.center,
                                decoration: kTextFieldDecoration.copyWith(
                                    hintText: "Enter your Password"),
                                onChanged: (value) {
                                  password = value;
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              Button(
                                buttonColor: Colors.green,
                                buttonText: 'Register',
                                onPressed: () async {
                                  _firestore.collection('initials').add({
                                    'first-name': firstName,
                                    'last-name': lastName
                                  });
                                  try {
                                    final newUser = await _auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);
                                    if (newUser != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen(
                                                  firstName: firstName,
                                                )),
                                      );
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
