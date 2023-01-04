import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_filter.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_list.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_map.dart';
import 'package:auto/features/dealers/presentation/widgets/segmented_control.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DealerScreen extends StatefulWidget {
  const DealerScreen({Key? key, this.isDirectoryPage = false})
      : super(key: key);
  final bool isDirectoryPage;

  @override
  State<DealerScreen> createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold(
          body: DefaultTabController(
            length: 2,
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor:
                      Theme.of(context).extension<ThemedColors>()!.whiteToNero,
                  leadingWidth: 0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(AppIcons.chevronLeft),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: WTextField(
                          borderColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmokeToNightRider,
                          fillColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmokeToNightRider,
                          hintText: LocaleKeys.model_brand.tr(),
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
                      WButton(
                        onTap: () => Navigator.of(context, rootNavigator: true)
                            .push(fade(
                                page: DealersFilter(
                          isDirectoryPage: widget.isDirectoryPage,
                        ))),
                        borderRadius: 12,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteSmokeToNightRider,
                        padding: const EdgeInsets.all(12),
                        child: widget.isDirectoryPage
                            ? SvgPicture.asset(AppIcons.filter)
                            : SvgPicture.asset(
                                AppIcons.rentFilter,
                                color: purple,
                              ),
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
                      DealersList(
                        isDirectoryPage: widget.isDirectoryPage,
                      ),
                      const MapScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
