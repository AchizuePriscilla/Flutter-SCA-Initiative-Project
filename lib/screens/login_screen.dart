import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(-1, -1),
                 
                  stops: [
                0.03,
                0.2,
                0.8,
                1,
              ],
                  colors: [
                Color(0xff263C57),
                Color(0xff1C1B2C),
                Color(0xff46245D),
                Color(0xff46283A),
              ])),
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Log in',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                onChanged: (value) {},
                // decoration: kTextFieldDecoration,
              )
            ],
          ),
        ),
      ),
    );
  }
}
