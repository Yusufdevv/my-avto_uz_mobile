import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/widgets/regions_bottomsheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegionButton extends StatefulWidget {
  final String title;

  const RegionButton({required this.title, Key? key}) : super(key: key);

  @override
  State<RegionButton> createState() => _RegionButtonState();
}

class _RegionButtonState extends State<RegionButton> {
  Region? currentRegion;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          showRegionsBottomSheet(
                  context, context.read<RegionsBloc>().state.regions)
              .then((value) {
            context
                .read<RegisterBloc>()
                .add(RegisterEvent.changeRegion(region: value.id));
            setState(() {
              currentRegion = value;
            });
          });
        },
        child: BlocBuilder<RegionsBloc, RegionsState>(
          builder: (context, state) => Container(
            padding: const EdgeInsets.only(right: 8, top: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(LocaleKeys.region.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currentRegion != null &&
                                    currentRegion!.title.isNotEmpty
                                ? currentRegion!.title
                                : LocaleKeys.choose_region.tr(),
                            style: currentRegion == null ||
                                    currentRegion!.title.isEmpty
                                ? Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)
                                : Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: 15),
                          ),
                          SvgPicture.asset(
                            AppIcons.chevronRight,
                            height: 20,
                            width: 20,
                            color: Colors.black,
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1, color: dividerColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
