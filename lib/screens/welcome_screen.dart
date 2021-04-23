import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/routes/route_names.dart';

import 'package:flutterscainitiativeproject/shared/constants.dart';
import 'package:flutterscainitiativeproject/shared/widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset("assets/images/myRecipeLogo.png"),
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ),
                    Text(
                      'MyRecipe',
                      style: kHeaderTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Button(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.loginScreen);
                  },
                  buttonColor: Colors.lightGreenAccent,
                  buttonText: 'Log in',
                ),
                Button(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.registerScreen);
                  },
                  buttonColor: Colors.green,
                  buttonText: 'Register',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
