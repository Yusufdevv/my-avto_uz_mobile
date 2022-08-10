import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageInFullScreen extends StatelessWidget {
  const ImageInFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: dark,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16),
                  child: SvgPicture.asset(
                    AppIcons.chevronLeft,
                    color: solitude,
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Stack(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: PageView(
                    children: [
                      Container(
                        color: white,
                      )
                    ],
                  ),
                ),
                Positioned(
                    right: MediaQuery.of(context).size.width * 0.45,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: black.withOpacity(0.2)),
                      child: const Text(
                        '1/12',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: white),
                      ),
                    ))
              ]),
            ],
          ),
        ),
      );
}
