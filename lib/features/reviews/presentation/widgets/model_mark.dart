import 'package:auto/features/reviews/presentation/pages/choose_car_screen.dart';
import 'package:flutter/material.dart';

Widget modelContainer(BuildContext context) => GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChooseCarScreen()),
      ), behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 54,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Марка и модель',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
