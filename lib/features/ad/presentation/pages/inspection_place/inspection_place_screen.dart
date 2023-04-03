// ignore_for_file: unused_import

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/domain/entities/district_entity.dart';

import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/point_name_shimmer.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/choose_district_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/loader_box.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/switcher_row_as_button_also.dart';
import 'package:auto/features/rent/data/models/region_model.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shimmer/shimmer.dart';

class InspectionPlaceScreen extends StatefulWidget {
  final VoidCallback onToMapPressed;

  const InspectionPlaceScreen({required this.onToMapPressed, Key? key})
      : super(key: key);

  @override
  State<InspectionPlaceScreen> createState() => _InspectionPlaceScreenState();
}

class _InspectionPlaceScreenState extends State<InspectionPlaceScreen> {
  late GlobalKey globalKey;

  @override
  void initState() {
    globalKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          headerText: LocaleKeys.place_of_inspection.tr(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<PostingAdBloc, PostingAdState>(
              builder: (context, state) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CHOOSE REGION
                    LoaderBox(
                      isActive: state.region != null,
                      isLoading:
                          state.status == FormzStatus.submissionInProgress,
                      onTap: () async {
                        await showModalBottomSheet<List<RegionEntity>>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => RentChooseRegionBottomSheet(
                            isMultiChoice: false,
                            checkedRegions: state.region != null
                                ? {0: state.region!}
                                : <int, RegionEntity>{},
                            list: state.regions,
                          ),
                        ).then((value) {
                          if (value != null && value.isNotEmpty) {
                            context
                                .read<PostingAdBloc>()
                                .add(PostingAdChooseEvent(regionId: value[0]));
                          }
                        });
                      },
                      hintText:
                          state.region?.title ?? LocaleKeys.choose_region.tr(),
                      title: LocaleKeys.area.tr(),
                    ),
                    const SizedBox(height: 16),

                    // CHOOSE DISTRICT
                    LoaderBox(
                      isActive: state.district != null,
                      isLoading: state.getDistrictsStatus ==
                          FormzStatus.submissionInProgress,
                      onTap: () async {
                        if (state.districts.isEmpty) {
                          context.read<ShowPopUpBloc>().add(
                                ShowPopUp(
                                  message:
                                      LocaleKeys.the_before_choose_region.tr(),
                                  status: PopStatus.warning,
                                ),
                              );
                          return;
                        }
                        await showModalBottomSheet<DistrictEntity>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => ChooseDistrictSheet(
                            selectedId: state.district?.id ?? -1,
                            districts: state.districts,
                          ),
                        ).then((value) {
                          if (value != null) {
                            context
                                .read<PostingAdBloc>()
                                .add(PostingAdChooseEvent(
                                  districtId: value,
                                ));
                          }
                        });
                      },
                      hintText:
                          state.district?.title ?? LocaleKeys.choose_area.tr(),
                      title:
                          '${LocaleKeys.area.tr()} / ${LocaleKeys.city.tr().toLowerCase()}',
                    ),

                    const SizedBox(height: 17),
                    SwitcherRowAsButtonAlso(
                      onTap: () {
                        widget.onToMapPressed();
                      },
                      title: LocaleKeys.show_exactly_geoposition.tr(),
                      value: state.showExactAddress,
                      onChanged: (v) {
                        if (!v) {
                          context
                              .read<PostingAdBloc>()
                              .add(PostingAdChooseEvent(showExactAddress: v));
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    if (state.getLocationImage.isSubmissionInProgress) ...{
                      Shimmer.fromColors(
                        baseColor: grey.withOpacity(0.15),
                        highlightColor: grey.withOpacity(0.26),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 17),
                          height: 200,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(12),
                            // image: state.mapPointBytes != null
                            //     ? DecorationImage(
                            //         image: MemoryImage(state.mapPointBytes!),
                            //         fit: BoxFit.cover,
                            //       )
                            //     : null,
                          ),
                          child: state.mapPointBytes == null
                              ? null
                              : Image.memory(state.mapPointBytes!),
                        ),
                      ),
                    } else if (state.mapPointBytes != null &&
                        (state.mapPointBytes?.isNotEmpty ?? false) &&
                        state.showExactAddress) ...{
                      Container(
                        margin: const EdgeInsets.only(bottom: 17),
                        height: 200,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: MemoryImage(state.mapPointBytes!),
                              fit: BoxFit.cover,
                            )),
                        // child:Image.asset(AppIcons.currentLoc),
                      ),
                    },


                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
