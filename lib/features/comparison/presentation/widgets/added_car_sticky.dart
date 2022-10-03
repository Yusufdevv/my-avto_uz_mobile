import 'package:auto/assets/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StickyAdderCar extends StatelessWidget {
  const StickyAdderCar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          SizedBox(
            width: 44,
            height: 44,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SvgPicture.asset(AppImages.placeHolder, fit: BoxFit.fill),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '227 000 000 UZS',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 12),
              ),
              const SizedBox(height: 2),
              Text(
                'Lexus LX',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ],
          ),
        ],
      );
}
