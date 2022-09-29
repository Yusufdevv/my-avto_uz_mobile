import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
          decoration: const BoxDecoration(
            color: bottomSheetColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
          ),
          child: CupertinoActionSheetAction(
            child: Text(
              LocaleKeys.Complain.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w400, color: red),
            ),
            onPressed: () {
              Navigator.pop(context, LocaleKeys.Complain.tr());
            },
          ),
        ),
        Divider(
          height: 0,
          thickness: 1,
          color: brightGrey.withOpacity(0.65),
        ),
        Container(
          decoration: const BoxDecoration(
            color: bottomSheetColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(13)),
          ),
          child: CupertinoActionSheetAction(
            child: Text(
              LocaleKeys.copy_url.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context, LocaleKeys.Complain.tr());
            },
          ),
        ),
        const SizedBox(height: 8),
        WButton(
            height: 60,
            borderRadius: 13,
            text: LocaleKeys.cancel.tr(),
            color: blackRussian,
            textStyle: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
            onTap: () {
              Navigator.pop(context);
            }),
        SizedBox(height: 10 + mediaQuery.padding.bottom),
      ],
    );
  }
}
