import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_filter.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_list.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_map.dart';
import 'package:auto/features/dealers/presentation/widgets/segmented_control.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DealersMain extends StatefulWidget {
  const DealersMain({Key? key}) : super(key: key);

  @override
  State<DealersMain> createState() => _DealersMainState();
}

class _DealersMainState extends State<DealersMain>
    with TickerProviderStateMixin {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          body: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor:
                    Theme.of(context).extension<ThemedColors>()!.whiteToNero,
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
                        borderColor: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteSmokeToNightRider,
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
                        Navigator.push(
                            context, fade(page: const DealersFilter()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteSmokeToNightRider),
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(Theme.of(context)
                              .extension<ThemedIcons>()!
                              .filterIcon)),
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SegmentedControl(maxHeight: 64, minHeight: 64),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    DealersList(),
                    const YandexKarta(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
