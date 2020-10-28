import 'package:flutter/material.dart';

const TextStyle detailText = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w800,
);
const TextStyle smaller_detailText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
);
const TextStyle detailTextBlack =
    TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Colors.black);
const TextStyle smaller_detailTextBlack =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black);
const TextStyle decorationText =
    TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white);
const TextStyle smaller_decorationText =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white);
const TextStyle decorationTextBlack =
    TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Colors.black);
const TextStyle smaller_decorationTextBlack =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black);
//button
const double btnElevation = 8;
const Color selectedBtn = Colors.blue;
const Color unSelectedBtn = Color(0xffF9C449);
RoundedRectangleBorder selectButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(9.0),
);
Divider customDivider(double height) {
  return Divider(
    height: height,
    thickness: 5,
    color: unSelectedBtn,
  );
}
