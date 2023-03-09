import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/presentation/parts/verifered_owner_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BecomeVerifiredOwnerWidget extends StatelessWidget {
  const BecomeVerifiredOwnerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: (){
      Navigator.push(context, fade(page:const VerifiredOwnerPage()));
    },
    child: Container(
          padding: const EdgeInsets.only(right: 10, left: 16, top: 7, bottom: 16),
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      LocaleKeys.become_verifered_owner.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      LocaleKeys.by_becoming_verified_owner_you.tr(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 96,
                width: 96,
                child: Image.asset(
                  AppImages.verifired_owner,
                ),
              )
            ],
          ),
        ),
  );
}
