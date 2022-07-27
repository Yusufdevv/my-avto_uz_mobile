import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_filter.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_list.dart';
import 'package:auto/features/dealers/presentation/widgets/segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DealersMain extends StatefulWidget {
  const DealersMain({Key? key}) : super(key: key);

  @override
  State<DealersMain> createState() => _DealersMainState();
}

class _DealersMainState extends State<DealersMain> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverAppBar(
                      backgroundColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToNero,
                      leadingWidth: 0,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(AppIcons.chevronLeft),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: WTextField(
                              hasBorderColor: false,
                              fillColor: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteSmokeToNightRider,
                              hintText: 'Марка, Модель',
                              hintTextStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: grey),
                              focusColor: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteSmokeToNightRider,
                              onChanged: (value) {},
                              hasSearch: true,
                              borderRadius: 8,
                            ),
                          ),
                          const SizedBox(width: 11),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const DealersFilter()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmokeToNightRider),
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                AppIcons.filter,
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .mediumSlateBlueToDolphin,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SegmentedControl(maxHeight: 64.0, minHeight: 64.0),
                ),
              ],
              body: const TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [DealersList(), YandexMap()],
              ),
            ),
          ),
        ),
      );
}
