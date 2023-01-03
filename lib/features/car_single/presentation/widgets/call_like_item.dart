import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallLikeItem extends StatelessWidget {
  final String icon;
  final String number;
  final String text;

  const CallLikeItem(
      {Key? key, required this.icon, required this.number, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 17,
                height: 17,
                color: orange,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                number,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(
                        0xff171725,
                      ),
                    ),
              )
            ],
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(
                    0xff696974,
                  ),
                ),
          ),
        ],
      );
}