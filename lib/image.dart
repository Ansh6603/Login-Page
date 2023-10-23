import 'package:flutter/material.dart';

Image logoTanker(String imgName) {
  return Image.asset(
    imgName,
    fit: BoxFit.fitWidth,
    width: 300,
  );
}
