import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DealerCard extends StatefulWidget {
  final Widget picture;
  const DealerCard({Key? key, required this.picture}) : super(key: key);

  @override
  State<DealerCard> createState() => _DealerCardState();
}

class _DealerCardState extends State<DealerCard> {
  bool showContact = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  widget.picture,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ORIENT MOTORS',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'Автосалон',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: purple),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.vehicleCar),
                  const SizedBox(width: 8),
                  Text('164 автомобиля',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.clock),
                  const SizedBox(width: 8),
                  Text('Каждый день, 9:00 - 21:00',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400))
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text(
                    'Контракты:',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: warmerGrey),
                  )),
                  Text('+998 97 ',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                  AnimatedCrossFade(
                    firstChild: Text('123 45 67',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    secondChild: GestureDetector(
                      onTap: () {
                        setState(() => showContact = true);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Показать контракт',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    crossFadeState: showContact
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
