import 'package:auto/features/ad/domain/entities/district_entity.dart';

import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/choose_district_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/loader_box.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/switcher_row_as_button_also.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class InspectionPlaceScreen extends StatefulWidget {
  final VoidCallback onToMapPressed;
  const InspectionPlaceScreen({required this.onToMapPressed, Key? key})
      : super(key: key);

  @override
  State<InspectionPlaceScreen> createState() => _InspectionPlaceScreenState();
}

class _InspectionPlaceScreenState extends State<InspectionPlaceScreen> {
  void hidePopUp() {
    context.read<ShowPopUpBloc>().add(HidePopUp());
  }

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
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CHOOSE REGION
                  LoaderBox(
                    isActive: state.regionId != null,
                    isLoading: state.status == FormzStatus.submissionInProgress,
                    onTap: () async {
                      hidePopUp();
                      await showModalBottomSheet<List<Region>>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => RentChooseRegionBottomSheet(
                          isMultiChoice: false,
                          checkedRegions: state.getSelectedRegion.id > -1
                              ? {0: state.getSelectedRegion}
                              : <int, Region>{},
                          list: state.regions,
                        ),
                      ).then((value) {
                        if (value != null && value.isNotEmpty) {
                          context
                              .read<PostingAdBloc>()
                              .add(PostingAdChooseEvent(regionId: value[0].id));
                        }
                      });
                    },
                    hintText: (state.getSelectedRegion.id == -1)
                        ? LocaleKeys.choose_region.tr()
                        : state.getSelectedRegion.title,
                    title: LocaleKeys.area.tr(),
                  ),
                  const SizedBox(height: 16),

                  // CHOOSE DISTRICT
                  LoaderBox(
                    isActive: state.districtTitle != null,
                    isLoading: state.getDistrictsStatus ==
                        FormzStatus.submissionInProgress,
                    onTap: () async {
                      hidePopUp();
                      if (state.districts.isEmpty) {
                        context.read<ShowPopUpBloc>().add(
                              ShowPopUp(
                                dismissible: false,
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
                          selectedId: state.districtId ?? -1,
                          districts: state.districts,
                        ),
                      ).then((value) {
                        if (value != null) {
                          context
                              .read<PostingAdBloc>()
                              .add(PostingAdChooseEvent(
                                districtId: value.id,
                              ));
                        }
                      });
                    },
                    hintText:
                        state.districtTitle ?? LocaleKeys.choose_area.tr(),
                    title:
                        '${LocaleKeys.area.tr()} / ${LocaleKeys.city.tr().toLowerCase()}',
                  ),

                  const SizedBox(height: 17),
                  if (state.mapPointBytes != null &&
                      (state.mapPointBytes?.isNotEmpty ?? false) &&
                      state.showExactAddress) ...{
                    Container(
                      height: 200,
                      //  margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: MemoryImage(state.mapPointBytes!),
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(height: 17),
                  },

                  SwitcherRowAsButtonAlso(
                    onTap: () {
                      hidePopUp();
                      widget.onToMapPressed();
                    },
                    title: LocaleKeys.show_exactly_geoposition.tr(),
                    value: state.showExactAddress,
                    onChanged: (v) {
                      hidePopUp();
                      if (!v) {
                        context
                            .read<PostingAdBloc>()
                            .add(PostingAdChooseEvent(showExactAddress: v));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
