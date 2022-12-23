import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/dealers/presentation/widgets/filter_region_mark_container.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DirectoryFilterPage extends StatefulWidget {
  const DirectoryFilterPage({Key? key}) : super(key: key);

  @override
  State<DirectoryFilterPage> createState() => _DirectoryFilterPageState();
}

class _DirectoryFilterPageState extends State<DirectoryFilterPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: white,
        appBar: WAppBar(
          boxShadow: const [],
          titleStyle:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16),
          extraActions: [
            Text(LocaleKeys.filter.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
            const Spacer(flex: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.h(16)),
              child: Text(
                LocaleKeys.clear.tr(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: blue),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(SizeConfig.h(16), SizeConfig.v(20),
              SizeConfig.h(16), SizeConfig.v(16)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.v(20)),
                //
                Text(LocaleKeys.region.tr(),
                    style: TextStyle(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .greySuitToWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                SizedBox(height: SizeConfig.v(8)),
                ContainerRegionMark(
                  markOrRegion: LocaleKeys.region.tr(),
                ),
                SizedBox(height: SizeConfig.v(16)),
                //
                Text('Категории',
                    style: TextStyle(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .greySuitToWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                SizedBox(height: SizeConfig.v(12)),
                Wrap(
                  spacing: SizeConfig.v(16),
                  runSpacing: SizeConfig.h(12),
                  children: List.generate(
                    10,
                    (index) => WButton(
                      width: (MediaQuery.of(context).size.width / 2) -
                          SizeConfig.h(24),
                      borderRadius: 8,
                      border: Border.all(color: dividerColor),
                      shadow: [
                        BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 16,
                            color: darkBlack.withOpacity(0.05))
                      ],
                      onTap: () {},
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.h(12),
                          vertical: SizeConfig.v(12)),
                      color: white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Автосервис',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(height: 1.3, color: nero)),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.h(4),
                                vertical: SizeConfig.v(4)),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFF8F5),
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.h(4))),
                            child: Text(
                              '24',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(color: orange),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: WButton(
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          onTap: () {},
          text: LocaleKeys.apply.tr(),
        ),
      );
}
