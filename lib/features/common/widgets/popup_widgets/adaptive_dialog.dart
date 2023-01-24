import 'dart:io' show Platform;

import 'package:auto/assets/colors/color.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveDialog extends StatelessWidget {
  final String title;
  final String? positiveButtonTitle;
  final String bodyText;
  final VoidCallback onTapPositive;

  const AdaptiveDialog({
    required this.title,
    required this.bodyText,
    required this.onTapPositive,
    this.positiveButtonTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
        ),
        content: Text(
          bodyText,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                    height: 44,
                    child: Center(
                        child: Text(
                      LocaleKeys.cancel.tr(),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: blue),
                    ))),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: onTapPositive,
                child: SizedBox(
                    height: 44,
                    child: Center(
                        child: Text(
                      positiveButtonTitle ?? 'Leave',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: red),
                    ))),
              ),
              const SizedBox(
                width: 5,
              )
            ],
          )
        ],
      );
    } else {
      return CupertinoAlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
        ),
        content: Text(
          bodyText,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
                height: 44,
                child: Center(
                    child: Text(
                  LocaleKeys.cancel.tr(),
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 17, color: blue),
                ))),
          ),
          GestureDetector(
            onTap: onTapPositive,
            child: SizedBox(
                height: 44,
                child: Center(
                    child: Text(
                  positiveButtonTitle ?? 'Continue',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 17, fontWeight: FontWeight.w600, color: red),
                ))),
          )
        ],
      );
    }
  }
}
