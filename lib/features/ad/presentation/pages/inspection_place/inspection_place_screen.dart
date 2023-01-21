import 'package:auto/features/ad/domain/entities/district_entity.dart';
import 'package:auto/features/ad/presentation/bloc/inspection_place/instpection_place_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/choose_district_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/loader_box.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/usecases/get_districts_usecase.dart';
import 'package:auto/features/common/usecases/get_regions.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
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
  late InspectionPlaceBloc instpectionPlaceBloc;
  @override
  void initState() {
    instpectionPlaceBloc = InspectionPlaceBloc(
        getRegions: GetRegionsUseCase(), districtUseCase: GetDistrictsUseCase())
      ..add(InstpectionPlaceGetRegionsEvent());
    super.initState();
  }

  void hidePopUp() {
    context.read<ShowPopUpBloc>().add(HidePopUp());
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: instpectionPlaceBloc,
        child: CustomScreen(
          child: Scaffold(
            body: BlocBuilder<InspectionPlaceBloc, InspectionPlaceState>(
              builder: (context, state) => BaseWidget(
                headerText: 'Место осмотра',
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<PostingAdBloc, PostingAdState>(
                    builder: (context, postingAdState) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoaderBox(
                          isLoading: state.getRegionsStatus ==
                              FormzStatus.submissionInProgress,
                          onTap: () async {
                            await showModalBottomSheet<List<Region>>(
                              isDismissible: false,
                              context: context,
                              isScrollControlled: true,
                              barrierColor: Colors.amber,
                              backgroundColor: Colors.transparent,
                              builder: (c) => RentChooseRegionBottomSheet(
                                isOtherPage: true,
                                isProfileEdit: true,
                                checkedRegions: postingAdState.region == null
                                    ? <int, Region>{}
                                    : {0: postingAdState.region!},
                                list: state.regions,
                              ),
                            ).then((value) {
                              context
                                  .read<PostingAdBloc>()
                                  .add(PostingAdChooseEvent(region: value?[0]));
                              if (value is List<Region> && value.isNotEmpty) {
                                instpectionPlaceBloc.add(
                                  InstpectionPlaceGetDistrictsEvent(
                                    regionId: value[0].id,
                                  ),
                                );
                              }
                            });
                          },
                          hintText: postingAdState.region == null
                              ? 'Выберите регион'
                              : postingAdState.region!.title,
                          title: 'Район',
                        ),
                        const SizedBox(height: 16),
                        LoaderBox(
                          isLoading: state.getDistrictsStatus ==
                              FormzStatus.submissionInProgress,
                          onTap: () async {
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
                                selectedId: context
                                        .watch<PostingAdBloc>()
                                        .state
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
                          hintText: postingAdState.district?.title ??
                              'Выберите район',
                          title: 'Район / город',
                        ),
                        const SizedBox(height: 17),
                        SwitcherRow(
                          title: 'Указать точную геопозицию',
                          value: postingAdState.showExactAddress,
                          onChanged: (v) {
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
          ),
        ),
      );
}
