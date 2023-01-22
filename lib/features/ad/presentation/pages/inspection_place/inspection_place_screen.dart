import 'package:auto/features/ad/domain/entities/district_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/choose_district_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/loader_box.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class InspectionPlaceScreen extends StatefulWidget {
  const InspectionPlaceScreen({Key? key}) : super(key: key);

  @override
  State<InspectionPlaceScreen> createState() => _InspectionPlaceScreenState();
}

class _InspectionPlaceScreenState extends State<InspectionPlaceScreen> {
  void hidePopUp() {
    context.read<ShowPopUpBloc>().add(HidePopUp());
  }

  @override
  Widget build(BuildContext context) => CustomScreen(
        child: Scaffold(
          body: BaseWidget(
            headerText: 'Место осмотра',
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<PostingAdBloc, PostingAdState>(
                builder: (context, state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoaderBox(
                      isLoading: state.getDistrictsStatus ==
                          FormzStatus.submissionInProgress,
                      onTap: () async {
                        hidePopUp();
                        await showModalBottomSheet<List<Region>>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          barrierColor: Colors.amber,
                          backgroundColor: Colors.transparent,
                          builder: (c) => RentChooseRegionBottomSheet(
                            isOtherPage: true,
                            isProfileEdit: true,
                            checkedRegions: state.region == null
                                ? <int, Region>{}
                                : {0: state.region!},
                            list: state.regions,
                          ),
                        ).then((value) {
                          if (value != null && value.isNotEmpty) {
                            context
                                .read<PostingAdBloc>()
                                .add(PostingAdChooseEvent(region: value[0]));
                          }
                        });
                      },
                      hintText: state.region == null
                          ? 'Выберите регион'
                          : state.region!.title,
                      title: 'Район',
                    ),
                    const SizedBox(height: 16),
                    WButton(onTap: () {
                      context.read<PostingAdBloc>().add(PostingAdGetDistritsEvent(regionId: state.region!.id));
                    }),
                    LoaderBox(
                      isLoading: state.getDistrictsStatus ==
                          FormzStatus.submissionInProgress,
                      onTap: () async {
                        hidePopUp();
                        if (state.districts.isEmpty) {
                          context.read<ShowPopUpBloc>().add(
                                ShowPopUp(
                                  dismissible: false,
                                  message: 'Сначала выберите регион',
                                  isSucces: true,
                                ),
                              );
                          return;
                        }
                        await showModalBottomSheet<DistrictEntity>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          barrierColor: Colors.amber,
                          backgroundColor: Colors.transparent,
                          builder: (c) => ChooseDistrictSheet(
                            selectedId: state
                                    .district
                                    ?.id ??
                                -1,
                            districts: state.districts,
                          ),
                        ).then((value) {
                          if (value != null) {
                            context
                                .read<PostingAdBloc>()
                                .add(PostingAdChooseEvent(district: value));
                          }
                        });
                      },
                      hintText: state.district?.title ?? 'Выберите район',
                      title: 'Район / город',
                    ),
                    const SizedBox(height: 17),
                    SwitcherRow(
                      title: 'Указать точную геопозицию',
                      value: state.showExactAddress,
                      onChanged: (v) {
                        hidePopUp();
                        context
                            .read<PostingAdBloc>()
                            .add(PostingAdChooseEvent(showExactAddress: v));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
