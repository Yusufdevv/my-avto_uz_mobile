import 'package:flutter/material.dart';

// ignore: prefer_expression_function_bodies
Widget floatingActionButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 156),
    child: FloatingActionButton(
      onPressed: () {},
      backgroundColor: const Color(0xffEA5930),
      child: const Center(
          child: Icon(
        Icons.add,
        color: Colors.white,
      )),
    ),
  );
}
