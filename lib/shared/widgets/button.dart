import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Function onPressed;
  Button({this.buttonColor, this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        color: buttonColor,
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: MediaQuery.of(context).size.width * 0.91,
          height: 40,
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
