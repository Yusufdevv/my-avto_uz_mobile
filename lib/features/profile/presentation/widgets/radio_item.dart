import 'package:auto/features/profile/presentation/widgets/w_radio.dart';
import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {
  final String title;
  final ValueChanged<int> onTap;
  final int value;
  final int groupValue;
  final bool isHaveImage;
  final String? img;

  const RadioItem({
    required this.onTap,
    required this.title,
    required this.groupValue,
    required this.value,
    this.isHaveImage = false,
    this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(groupValue);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              Row(
                children: [
                  WRadio(
                      onChanged: onTap, value: value, groupValue: groupValue),
                  const SizedBox(width: 10),
                  if (isHaveImage == true)
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 28,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.asset(
                              img!,
                            ),
                          ),
                        ),
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  else
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  const SizedBox(width: 4),
                ],
              ),
            ],
          ),
        ),
      );
}
