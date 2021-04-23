import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String text;
  final Color containerColor;
  final Color textColor;

  const CategoryTile(
      {@required this.text,
      @required this.containerColor,
      @required this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: containerColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        child: Text(
          text != null ? text : "",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
