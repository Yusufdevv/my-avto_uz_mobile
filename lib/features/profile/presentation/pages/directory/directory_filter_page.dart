import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/directory_filter_category.dart';
import 'package:auto/features/profile/presentation/widgets/edit_item_container.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DirectoryFilterPage extends StatefulWidget {
  const DirectoryFilterPage(
      {required this.bloc, required this.mapBloc, Key? key})
      : super(key: key);
  final DirectoryBloc bloc;
  final MapOrganizationBloc mapBloc;

  @override
  State<DirectoryFilterPage> createState() => _DirectoryFilterPageState();
}

class _DirectoryFilterPageState extends State<DirectoryFilterPage> {
  @override
  void initState() {
    if (widget.bloc.state.regions.isEmpty) {
      widget.bloc.add(DirectoryGetRegionsEvent());
    }
    if (widget.bloc.state.categories.isEmpty) {
      widget.bloc.add(GetDirCategoriesEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: Colors.teal,
        backgroundColor:
            Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
        appBar: WAppBar(
          boxShadow: const [],
          titleStyle:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16),
          extraActions: [
            Text(LocaleKeys.filter.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
            const Spacer(flex: 30),
            WScaleAnimation(
              onTap: () {
                context.read<DirectoryBloc>().add(DirectoryClearFilterEvent());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  LocaleKeys.clear.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: blue),
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<DirectoryBloc, DirectoryState>(
          builder: (context, state) {
            if (state.status.isSubmissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state.status.isSubmissionSuccess) {
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              await showModalBottomSheet<List<RegionEntity>>(
                                isDismissible: false,
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (c) => RentChooseRegionBottomSheet(
                                    checkedRegions:
                                        state.selectedRegions.asMap(),
                                    list: state.regions.isEmpty
                                        ? context
                                            .read<RegionsBloc>()
                                            .state
                                            .regions
                                        : state.regions),
                              ).then((value) {
                                if (value != null && value.isNotEmpty) {
                                  context.read<DirectoryBloc>().add(
                                      DirectorySetRegionsEvent(regions: value));
                                }
                              });
                            },
                            child: EditItemContainer(
                                isOtherPage: true,
                                icon: AppIcons.chevronRightBlack,
                                region: MyFunctions.regionsToToText(context
                                    .read<DirectoryBloc>()
                                    .state
                                    .selectedRegions)),
                          ),
                          const SizedBox(height: 16),

                          /// Категории
                          DirectoryFilterCategory(category: state.categories),
                        ],
                      ),
                    ),
                    BlocBuilder<MapOrganizationBloc, MapOrganizationState>(
                      builder: (context, mapState) => WButton(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                        onTap: () {
                          context
                              .read<DirectoryBloc>()
                              .add(GetDirectoriesEvent());
                          context
                              .read<MapOrganizationBloc>()
                              .add(MapOrganizationEvent.getDirectoriesPoints());
                          Navigator.pop(context);
                        },
                        text: LocaleKeys.apply.tr(),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      );
}
