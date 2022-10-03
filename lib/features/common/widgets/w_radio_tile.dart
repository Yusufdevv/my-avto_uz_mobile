import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RadioItem extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int value;
  final int groupValue;
  final String title;
  final bool hasImage;
  final String? image;

  const RadioItem({
    required this.onTap,
    required this.title,
    required this.groupValue,
    required this.value,
    this.image,
    this.hasImage = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(value);
        },
        child: Container(
          decoration: BoxDecoration(
            color: value == groupValue
                ? Theme.of(context)
                    .extension<ThemedColors>()!
                    .mediumSlateBlue50ToNightRider
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          child: hasImage
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            onTap(value);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: value == groupValue ? purple : grey,
                                    width: 1.5,
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                ),
                                padding: value == groupValue
                                    ? const EdgeInsets.all(3)
                                    : EdgeInsets.zero,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                height: 13,
                                width: 13,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: value == groupValue
                                      ? purple
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          title,
                          style: value == groupValue
                              ? Theme.of(context).textTheme.headline1!.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600)
                              : Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: greyText),
                        ),
                      ],
                    ),
                    SvgPicture.asset(image!),
                  ],
                )
              : Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        onTap(value);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: value == groupValue ? purple : grey,
                                width: 1.5,
                              ),
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            padding: value == groupValue
                                ? const EdgeInsets.all(3)
                                : EdgeInsets.zero,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: value == groupValue
                                  ? purple
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: value == groupValue
                          ? Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600)
                          : Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: greyText),
                    ),
                  ],
                ),
        ),
      );
}
