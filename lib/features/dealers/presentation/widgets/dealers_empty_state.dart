import 'package:auto/assets/constants/icons.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget dealersEmptyState()=> Center(
    child: Column(
      children: [
        SvgPicture.asset(AppIcons.carIcon),
        const SizedBox(height: 24),
        const Text(LocaleKeys.no_dealer),
      ],
    ),
  );