import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IdRow extends StatelessWidget {
  final String id;
  const IdRow({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => id.isEmpty
      ? const SizedBox()
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.id),
              const SizedBox(
                width: 8,
              ),
              Text(
                'previews[0].id',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 12, color: suvaGray),
              ),
            ],
          ),
        );
}
