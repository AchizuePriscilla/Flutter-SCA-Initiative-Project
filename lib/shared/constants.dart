import 'dart:ui';

import 'package:flutter/material.dart';

const InputDecoration kTextFieldDecoration = InputDecoration(
    hintText: "",
    hintStyle: TextStyle(
      color: Colors.black54,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: Colors.green, width: 2)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: Colors.green, width: 2)),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20));

const TextStyle kHeaderTextStyle =
    TextStyle(color: Colors.black, fontSize: 38, fontWeight: FontWeight.bold);
