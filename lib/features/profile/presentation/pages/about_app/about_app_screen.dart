import 'dart:async';

import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/about_app/terms_of_use_page.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  Timer? timer;

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:
            WAppBar(textWithButton: LocaleKeys.about_app.tr(), boxShadow: []),
        body: Column(
          children: [
            WScaleAnimation(
              onTap: () {
                context
                    .read<ProfileBloc>()
                    .add(GetTermsOfUseEvent(slug: 'условия пользования'));
                Navigator.of(context).push(fade(page: const TermsOfUsePage()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .borderColor),
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToNero1),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.file,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .darkToGrey),
                    const SizedBox(width: 8),
                    Text(LocaleKeys.terms_use.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontSize: 15, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
            //
            const Rate(),
            const Spacer(),
            //
            GestureDetector(
              onPanCancel: () => timer?.cancel(),
              onPanDown: (_) => timer = Timer(const Duration(seconds: 2), () {
                final chuck = StorageRepository.getBool(
                  StorageKeys.CHUCK,
                  defValue: false,
                );
                StorageRepository.putBool(
                  key: StorageKeys.CHUCK,
                  value: !chuck,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(!chuck ? 'ON' : 'OFF')));
              }),
              child: SvgPicture.asset(
                Theme.of(context).extension<ThemedIcons>()!.autoUzLightDark,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 36),
                child: Text(
                    '${LocaleKeys.version.tr()} ${_packageInfo.version}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium)),
          ],
        ),
      );
}
