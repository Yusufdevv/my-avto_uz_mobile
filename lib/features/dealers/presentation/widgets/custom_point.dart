import 'package:auto/assets/constants/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPoint extends StatelessWidget {
  const CustomPoint({
    required this.url,
    required this.scale,
    Key? key,
  }) : super(key: key);

  final String url;
  final double scale;

  @override
  Widget build(BuildContext context) {
    print('call');
    print(scale);
    print(url);
    return SizedBox(
        width: 44,
        height: 64,
        child: Stack(
          children: [
            Image.asset(
              AppIcons.dealersLocIcon,
              width: 44,
              height: 64,
            ),
            Positioned(
              top: 7,
              left: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset( url,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  errorBuilder: (context, url, error) {
                    print('error builder');
                    return Container();
                  },
                ),
              ),
            )
          ],
        ),
      );
  }
}
