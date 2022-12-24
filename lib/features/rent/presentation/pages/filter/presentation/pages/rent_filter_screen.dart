import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/widgets/range_slider.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/dealers/presentation/widgets/filter_region_mark_container.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/widgets/regions_bottomsheet.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RentFilterScreen extends StatefulWidget {
  const RentFilterScreen({Key? key}) : super(key: key);

  @override
  State<RentFilterScreen> createState() => _RentFilterScreenState();
}

class _RentFilterScreenState extends State<RentFilterScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          boxShadow: const [],
          extraActions: [
            Text(LocaleKeys.filter.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
            const Spacer(flex: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                LocaleKeys.clear.tr(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: blue),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SelectorItem(
                onTap: () {
                  showRegionsBottomSheet(
                          context, context.read<RegionsBloc>().state.regions)
                      .then((value) {
                    context
                        .read<RegisterBloc>()
                        .add(RegisterEvent.changeRegion(region: value.id));
                    setState(() {
                      // currentRegion = value;
                    });
                  });
                },
                hintText: LocaleKeys.choose_region.tr(),
                title: LocaleKeys.region.tr(),
                hasArrowDown: true,
              ),
              SelectorItem(
                onTap: () {},
                hintText: LocaleKeys.choose_brand.tr(),
                title: LocaleKeys.brand.tr(),
                hasArrowDown: true,
              ),
              SelectorItem(
                onTap: () {},
                hintText: LocaleKeys.choose_body.tr(),
                title: LocaleKeys.body_type.tr(),
              ),
              SelectorItem(
                onTap: () {},
                hintText: LocaleKeys.choose_class.tr(),
                title: LocaleKeys.classs.tr(),
              ),
              SelectorItem(
                onTap: () {},
                hintText: LocaleKeys.choose_drive_type.tr(),
                title: LocaleKeys.drive_unit.tr(),
              ),
              SelectorItem(
                onTap: () {},
                hintText: LocaleKeys.choose_box_type.tr(),
                title: LocaleKeys.box.tr(),
              ),
              const SizedBox(
                height: 16,
              ),
              WRangeSlider(
                title: LocaleKeys.year_of_issue.tr(),
                endValue: 2022,
                startValue: 1960,
                sliderStatus: '',
              ),
              const SizedBox(
                height: 16,
              ),
              WRangeSlider(
                title: LocaleKeys.price.tr(),
                endValue: 500000,
                startValue: 1000,
                sliderStatus: 'price',
              ),
              const SizedBox(
                height: 16,
              ),
              WButton(
                onTap: () => Navigator.pop(context),
                text: LocaleKeys.apply.tr(),
              ),
            ],
          ),
        ),
      );
}
