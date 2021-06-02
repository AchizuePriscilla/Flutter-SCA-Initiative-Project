import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/arguments/home_view_argument.dart';
import 'package:flutterscainitiativeproject/enums/auth_result_status.dart';
import 'package:flutterscainitiativeproject/routes/route_names.dart';
import 'package:flutterscainitiativeproject/screens/views/home_view.dart';
import 'package:flutterscainitiativeproject/services/auth_exception_handler.dart';
import 'package:flutterscainitiativeproject/services/firebase_auth_helper.dart';
import 'package:flutterscainitiativeproject/shared/constants.dart';
import 'package:flutterscainitiativeproject/shared/widgets/button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String email;
  String password;

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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
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
                                  textAlign: TextAlign.center,
                                  obscureText: true,
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
                                    buttonText: 'Log in',
                                    onPressed: () async {
                                      setState(() {
                                        showSpinner = true;
                                      });
                                      final status = await FirebaseAuthHelper()
                                          .login(email: email, pass: password);
                                      setState(() {
                                        showSpinner = false;
                                      });
                                      if (status ==
                                          AuthResultStatus.successful) {
                                        Navigator.pushNamed(
                                            context, RouteNames.homeScreen
                                            // arguments: HomeViewArguments(firstName)
                                            );

                                        // Navigator.pushAndRemoveUntil(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             HomeScreen()),
                                        //     (r) => false);
                                      } else {
                                        final errorMsg = AuthExceptionHandler
                                            .generateExceptionMessage(status);
                                        _showAlertDialog(errorMsg);
                                      }
                                    }),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
            backgroundColor: Colors.white,
            title: Text(
              'Login Failed',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(errorMsg),
          );
        });
  }
}
