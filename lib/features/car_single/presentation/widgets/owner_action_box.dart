import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/domain/entities/owner_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OwnerActionBox extends StatelessWidget {
  final Color color;

  final OwnerActionEntity entity;

  const OwnerActionBox({Key? key, required this.color, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 8, bottom: 11, left: 8, right: 8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: const Color(0xff171725).withOpacity(0.1))),
        child: Column(
          children: [
            SvgPicture.asset(
              entity.icon,
              height: 32,
              width: 32,
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              entity.title,textAlign: TextAlign.center,maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 11, fontWeight: FontWeight.w400,color: dark),
            )
          ],
        ),
      );
}
