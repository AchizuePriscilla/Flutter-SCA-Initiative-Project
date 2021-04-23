import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/routes/route_names.dart';
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
                                    try {
                                      final user = await _auth
                                          .signInWithEmailAndPassword(
                                              email: email, password: password);
                                      if (user != null) {
                                        Navigator.pushNamed(
                                            context, RouteNames.homeScreen);
                                      }
                                      setState(() {
                                        showSpinner = false;
                                      });
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                ),
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
}

// class AlignedText extends StatelessWidget {
//   final String text;
//   const AlignedText({@required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         text,
//         style: TextStyle(
//           color: Colors.blueGrey[700],
//           fontSize: 18,
//         ),
//       ),
//     );
//   }
// }
