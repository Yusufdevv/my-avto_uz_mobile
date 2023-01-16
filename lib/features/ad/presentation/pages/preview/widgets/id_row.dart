


import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/domain/entities/preview/preview_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IdRow extends StatelessWidget {
  const IdRow({
    required this.previews,
    Key? key,
  }) : super(key: key);

  final List<PreviewEntity> previews;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.id),
          const SizedBox(
            width: 8,
          ),
          Text(
            previews[0].id,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 12, color: suvaGray),
          ),
        ],
      ),
    );
}