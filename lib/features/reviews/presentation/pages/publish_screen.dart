import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/widgets/next_container.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class PublishScreen extends StatefulWidget {
  const PublishScreen({super.key});

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            nexContainer(),
          ],
        ),
      ),
    );
  }
}
