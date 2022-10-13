import 'package:flutter/material.dart';

Widget ownershipOptions(String text) => Padding(
      padding: const EdgeInsets.only(left: 16, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );

enum Options { first, second, third, fourth, fifth, sixth }
