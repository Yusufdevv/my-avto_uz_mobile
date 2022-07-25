import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final dx = Alignment.center.x + 0.146;
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      child:                 Stack(
        children: [
          Align(
            alignment: Alignment(dx, Alignment.center.y),
            child: CircleAvatar(
              radius: 20,
            ),
          )
        ],
      )
      ,
    );
}
