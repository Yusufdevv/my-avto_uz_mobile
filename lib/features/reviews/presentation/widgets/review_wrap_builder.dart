
import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewWrapBuilder extends StatelessWidget {
  final List<String> labels;
  final String title;
  final String titleIcon;
  final Color iconColor;
  const ReviewWrapBuilder({
    required this.labels,
    required this.title,
    required this.titleIcon,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: iconColor.withOpacity(0.1),
                ),
                height: 20,
                width: 20,
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  titleIcon,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 12.5),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              for (var i in labels)
                Chip(
                  label: Text(
                    i,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: border, width: 1),
                    borderRadius: BorderRadius.circular(44),
                  ),
                  backgroundColor: borderCircular,
                )
            ],
          ),
        ],
      );
}