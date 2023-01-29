import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/core/utils/size_config.dart';
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
  const AboutAppScreen({ Key? key}) : super(key: key);

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
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
  Widget build(BuildContext context) => Scaffold(
        appBar:   WAppBar(textWithButton: LocaleKeys.about_app.tr(), boxShadow: []),
        body: Column(
          children: [
            WScaleAnimation(
              onTap: () {
                context.read<ProfileBloc>().add(GetTermsOfUseEvent(slug: 'условия пользования'));
                Navigator.of(context).push(fade(
                    page: const TermsOfUsePage()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.h(16), vertical: SizeConfig.v(12)),
                margin: EdgeInsets.fromLTRB(SizeConfig.h(16), SizeConfig.v(20),
                    SizeConfig.h(16), SizeConfig.v(12)),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .borderColor),
                    borderRadius: BorderRadius.circular(SizeConfig.h(12)),
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToNero1),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.file,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .darkToGrey),
                    SizedBox(width: SizeConfig.h(8)),
                    Text(LocaleKeys.terms_use.tr(),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
            //
            const Rate(),
            const Spacer(),
            //
            SvgPicture.asset(
              Theme.of(context).extension<ThemedIcons>()!.autoUzLightDark,
            ),
            SizedBox(height: SizeConfig.v(12)),
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.v(2), bottom: SizeConfig.v(36)),
              child: Text(
                '${LocaleKeys.version.tr()} ${_packageInfo.version}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2
              )
            ),
          ],
        ),
      );
}
