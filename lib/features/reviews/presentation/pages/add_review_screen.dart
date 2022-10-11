import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/widgets/car_features.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  List strings = [
    LocaleKeys.brand.tr(),
    LocaleKeys.model.tr(),
    LocaleKeys.year_of_issue.tr(),
    LocaleKeys.generation.tr(),
    LocaleKeys.body_type.tr(),
    LocaleKeys.motor.tr(),
    LocaleKeys.choose_drive_type.tr(),
    LocaleKeys.choose_box_type.tr(),
    LocaleKeys.modification.tr(),
    LocaleKeys.ownership_term.tr(),
    LocaleKeys.plus.tr(),
    LocaleKeys.minus.tr(),
    LocaleKeys.rate.tr(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(23, 23, 37, 0.08),
              offset: Offset(0, 8),
              blurRadius: 24,
            )
          ]),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            titleSpacing: 24,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(AppIcons.appbar_back),
                ),
                const SizedBox(width: 16),
                Text(
                  LocaleKeys.add_review.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: LightThemeColors.appBarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 2),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 13,
                    backgroundColor: Color.fromRGBO(241, 241, 245, 1),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    LocaleKeys.auto.tr(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 52, bottom: 30),
              child: Text(
                '${LocaleKeys.filled.tr()} 1 из 13',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff696974),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => features(strings[index]),
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  indent: 16,
                  height: 32,
                ),
                itemCount: 13,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 44),
              height: 44,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: LightThemeColors.headline5,
              ),
              child: Center(
                child: Text(
                  LocaleKeys.further.tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
