import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/pages/add_review_screen.dart';
import 'package:auto/features/reviews/presentation/widgets/categories.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  List iconPath = [
    AppIcons.passenger_car,
    AppIcons.commercial_car,
    AppIcons.moto,
  ];
  List category = [
    LocaleKeys.passenger_cars.tr(),
    LocaleKeys.commercial.tr(),
    LocaleKeys.moto.tr(),
  ];
  @override
  Widget build(BuildContext context) => Container(
        height: 268,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.category.tr(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(
                      AppIcons.close,
                      height: 14,
                      width: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddReviewScreen(
                          category: '',
                        ),
                      ),
                    );
                  },
                  behavior: HitTestBehavior.opaque,
                  child: categories(iconPath[index], category[index]),
                ),
                separatorBuilder: (context, index) => const Divider(
                  indent: 16,
                  height: 12,
                  thickness: 1,
                ),
                itemCount: 3,
              ),
            ),
          ],
        ),
      );
}
