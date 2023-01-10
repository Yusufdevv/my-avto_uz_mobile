import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/widgets/filter_radio.dart';
import 'package:auto/features/dealers/presentation/widgets/filter_region_mark_container.dart';
import 'package:auto/features/profile/presentation/widgets/directory_filter_category.dart';
import 'package:auto/features/profile/presentation/widgets/edit_item_container.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealersFilter extends StatefulWidget {
  const DealersFilter({Key? key, this.isDirectoryPage = false})
      : super(key: key);
  final bool isDirectoryPage;

  @override
  State<DealersFilter> createState() => _DealersFilterState();
}

enum Category { all, news, withMileage }

class _DealersFilterState extends State<DealersFilter> {
  Category selectedCategory = Category.all;
  List<Region>? newRegion;

  @override
  void initState() {
    context.read<RegionsBloc>().add(RegionsEvent.getRegions());
    super.initState();
  }

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
            const Spacer(
              flex: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
        body: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!widget.isDirectoryPage)
                      Column(
                        children: [
                          Text(LocaleKeys.car_dealers.tr(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .greySuitToWhite)),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FilterRadio(
                                  value: Category.all,
                                  onChanged: (value) {
                                    setState(() => selectedCategory = value);
                                  },
                                  currentValue: selectedCategory),
                              FilterRadio(
                                  value: Category.news,
                                  onChanged: (value) {
                                    setState(() => selectedCategory = value);
                                  },
                                  currentValue: selectedCategory),
                              FilterRadio(
                                  value: Category.withMileage,
                                  onChanged: (value) {
                                    setState(() => selectedCategory = value);
                                  },
                                  currentValue: selectedCategory),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    Text(LocaleKeys.region.tr(),
                        style: TextStyle(
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .greySuitToWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(height: 8),
                    WScaleAnimation(
                      onTap: () async {
                        await showModalBottomSheet<List<Region>>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => RentChooseRegionBottomSheet(
                              list: context.read<RegionsBloc>().state.regions),
                        ).then((value) {
                          if (value != null && value.isNotEmpty) {
                            setState(() {
                              newRegion = value;
                            });
                          }
                        });
                      },
                      child: EditItemContainer(
                          isOtherPage: true,
                          icon: AppIcons.chevronRightBlack,
                          region: newRegion?[0].title ?? 'Выберите регион'),
                    ),
                    const SizedBox(height: 16),

                    //
                    if (!widget.isDirectoryPage)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LocaleKeys.brand.tr(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .greySuitToWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(height: 8),
                          ContainerRegionMark(
                            markOrRegion: LocaleKeys.brand.tr(),
                          ),
                        ],
                      ),

                    //Категории
                  ],
                ),
              ),
              WButton(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                onTap: () {},
                text: LocaleKeys.apply.tr(),
              ),
            ],
          ),
        ),
      );
}
