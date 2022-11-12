import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class PopularSearchesField extends StatelessWidget {
  PopularSearchesField({
    required this.title,
    required this.elements,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.hasClearButtonInTitle = false,
    this.hasClearTrailing = false,
    Key? key,
  }) : super(key: key);
  final bool hasClearButtonInTitle;
  final String title;
  final EdgeInsets titlePadding;
  final bool hasClearTrailing;
  List<String> elements;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 13),
          Padding(
            padding: titlePadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 13,
                        color: LightThemeColors.darkGreyToWhite,
                      ),
                ),
                if (hasClearButtonInTitle)
                  Text(
                    'Очистить',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 13,
                          color: blue,
                        ),
                  )
                else
                  const SizedBox(),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => WButton(
              onTap: () {},
              color: white,
              borderRadius: 0,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    elements[index],
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  if (hasClearTrailing)
                    GestureDetector(
                      child: SvgPicture.asset(AppIcons.close),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
            separatorBuilder: (context, index) =>
                const Divider(color: transparentButton, height: 1),
            itemCount: elements.length,
          ),
        ],
      );
}
