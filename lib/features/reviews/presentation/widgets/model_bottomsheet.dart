import 'package:auto/assets/constants/icons.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OwnershipBottomsheet extends StatefulWidget {
  const OwnershipBottomsheet({super.key});

  @override
  State<OwnershipBottomsheet> createState() => _OwnershipBottomsheetState();
}

class _OwnershipBottomsheetState extends State<OwnershipBottomsheet> {
  List optionsTitle = [
    'Менее 6 месяцев',
    '6-12 месяцев',
    '1-2 года',
    '2-3 года',
    '3-5 года',
    'Более 5 лет',
  ];

  Options? _options = Options.first;
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 812,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 20, 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.ownership_term.tr(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context), behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(AppIcons.close),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 16, right: 18),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () =>
                        setState(() => _options = Options.values[index]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          optionsTitle[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Radio(
                          value: Options.values[index],
                          activeColor: const Color(0xff695CEA),
                          groupValue: _options,
                          onChanged: (Options? value) =>
                              setState(() => _options = value),
                        )
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(
                  indent: 16,
                  thickness: 1,
                  height: 12,
                ),
                itemCount: optionsTitle.length,
              ),
            ),
          ],
        ),
      );
}

enum Options { first, second, third, fourth, fifth, sixth }
