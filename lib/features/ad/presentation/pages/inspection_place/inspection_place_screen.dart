import 'package:auto/features/ad/presentation/bloc/inspection_place/instpection_place_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/loader_box.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/usecases/get_regions.dart';
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
    instpectionPlaceBloc = InspectionPlaceBloc(getRegions: GetRegionsUseCase())
      ..add(InstpectionPlaceGetRegionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: instpectionPlaceBloc,
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
                        isLoading:
                            state.status == FormzStatus.submissionInProgress,
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
                          });
                        },
                        hintText: postingAdState.region == null
                            ? 'Выберите регион'
                            : postingAdState.region!.title,
                        title: 'Район',
                      ),
                      const SizedBox(height: 16),
                      LoaderBox(
                        isLoading:
                            state.status == FormzStatus.submissionInProgress,
                        onTap: () async {},
                        hintText: 'Выберите район',
                        title: 'Район / город',
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      SwitcherRow(
                        title: 'Указать точную геопозицию',
                        value: true,
                        onChanged: (v) {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
