import 'package:flutter/material.dart';

const TextStyle detailText = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w800,
);
const TextStyle smaller_detailText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
);
const TextStyle decorationText =
    TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white);
const TextStyle smaller_decorationText =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white);
//button
const double btnElevation = 8;
const Color selectedBtn = Colors.blue;
const Color unSelectedBtn = Color(0xffF9C449);
RoundedRectangleBorder selectButtonShape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        );