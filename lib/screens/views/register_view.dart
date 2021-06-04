import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/enums/auth_result_status.dart';
import 'package:flutterscainitiativeproject/routes/route_names.dart';
import 'package:flutterscainitiativeproject/services/auth_exception_handler.dart';
import 'package:flutterscainitiativeproject/services/firebase_auth_helper.dart';
import 'package:flutterscainitiativeproject/shared/constants.dart';
import 'package:flutterscainitiativeproject/shared/widgets/button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firestore = FirebaseFirestore.instance;
  final initialsRef = FirebaseFirestore.instance.collection('initials');
  bool showSpinner = false;
  String firstName;
  String lastName;
  String email;
  String password;
  String userID;
  User loggedinUser;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
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
                                  controller: firstNameController,
                                  textCapitalization: TextCapitalization.words,
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
                                  controller: lastNameController,
                                  textCapitalization: TextCapitalization.words,
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
                                  controller: emailController,
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
                                  controller: passwordController,
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
                                    setState(() {
                                      showSpinner = true;
                                    });

                                    final status = await FirebaseAuthHelper()
                                        .createAccount(
                                            email: email, pass: password);

                                    if (status == AuthResultStatus.successful) {
                                      loggedinUser =
                                          FirebaseAuth.instance.currentUser;
                                      _firestore
                                          .collection('initials')
                                          .doc(loggedinUser.uid)
                                          .set({
                                        'first-name': firstName,
                                        'last-name': lastName
                                      });
                                      firstNameController.clear();
                                      lastNameController.clear();
                                      emailController.clear();
                                      passwordController.clear();
                                      setState(() {
                                        showSpinner = false;
                                      });
                                      print(firstName);
                                      Navigator.pushNamed(
                                        context,
                                        RouteNames.homeScreen,
                                      );
                                    } else {
                                      final errorMsg = AuthExceptionHandler
                                          .generateExceptionMessage(status);
                                      _showAlertDialog(errorMsg);
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
      ),
    );
  }

  Future _showAlertDialog(errorMsg) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Login Failed',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(errorMsg),
          );
        });
  }
}
