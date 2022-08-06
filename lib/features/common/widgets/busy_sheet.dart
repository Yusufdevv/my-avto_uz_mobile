import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusySheet extends StatelessWidget {
  const BusySheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            color: bottomSheetColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
          ),
          child: CupertinoActionSheetAction(
            child:  Text(
              'Shikoyat qilish',
              style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w400,color: red),
            ),
            onPressed: () {
              Navigator.pop(context, 'Shikoyat qilish');
            },
          ),
        ),
        Container(
          height: 1,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: brightGrey.withOpacity(.65),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            color: bottomSheetColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(13)),
          ),
          child: CupertinoActionSheetAction(
            child:  Text(
              'Копировать ссылку',
              style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context, 'Shikoyat qilish');
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        WButton(
            height: 60,
            borderRadius: 13,
            text: 'Отмена',
            color: blackRussian,
            textStyle: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w400, fontSize: 20),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            onTap: () {
              Navigator.pop(context);
            }),
        SizedBox(height: 10 + mediaQuery.padding.bottom),
      ],
    );
  }
}
