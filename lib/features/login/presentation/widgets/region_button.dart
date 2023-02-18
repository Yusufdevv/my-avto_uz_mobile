import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegionButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const RegionButton({required this.onTap, required this.title, Key? key})
      : super(key: key);

  @override
  State<RegionButton> createState() => _RegionButtonState();
}

class _RegionButtonState extends State<RegionButton> {
  List<Region> currentRegion = <Region>[];

  @override
  void initState() {
    super.initState();
    context.read<RegionsBloc>().add(RegionsEvent.getRegions());
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          widget.onTap();
          showModalBottomSheet<List<Region>>(
            context: context,
            isDismissible: false,
            useRootNavigator: true,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => RentChooseRegionBottomSheet(
                checkedRegions: currentRegion.asMap(),
                isMultiChoice: false,
                list: context.read<RegionsBloc>().state.regions),
          ).then((value) {
            if (value != null && value.isNotEmpty) {
              setState(() {
                currentRegion = value;
              });
              context
                  .read<RegisterBloc>()
                  .add(RegisterEvent.changeRegion(region: currentRegion[0].id));
            }
          });
        },
        child: BlocBuilder<RegionsBloc, RegionsState>(
          builder: (context, state) => Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 13, top: 26),
                  child: Text(
                    LocaleKeys.region.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 29),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currentRegion.isNotEmpty
                                ? currentRegion[0].title
                                : LocaleKeys.choose_region.tr(),
                            style: currentRegion.isEmpty
                                ? Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        color: warmerGrey,
                                        fontWeight: FontWeight.w400)
                                : Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: dark),
                          ),
                          SvgPicture.asset(AppIcons.chevronRight,
                              height: 20, width: 20, color: Colors.black)
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(
                        height: 1,
                        color: dividerColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
