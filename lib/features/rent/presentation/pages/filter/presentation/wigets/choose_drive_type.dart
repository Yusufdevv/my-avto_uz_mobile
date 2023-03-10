import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/domain/usecases/get_drive_types_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/get_drive_types/get_drive_types_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/maker_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseDriveType extends StatefulWidget {
  final int selectedId;

  const ChooseDriveType({required this.selectedId, super.key});

  @override
  State<ChooseDriveType> createState() => _ChooseDriveTypeState();
}

class _ChooseDriveTypeState extends State<ChooseDriveType> {
  late GetDriveTypesBloc getDriveTypesBloc;

  @override
  void initState() {
    getDriveTypesBloc = GetDriveTypesBloc(
      selectedId: widget.selectedId,
      getBodyTypeUseCase: GetDriveTypesUseCase(
        repository: serviceLocator<AdRepositoryImpl>(),
      ),
    )..add(GetDriveTypesGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: getDriveTypesBloc,
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 44),
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: BlocBuilder<GetDriveTypesBloc, GetDriveTypesState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionSuccess ||
                  state.status == FormzStatus.submissionFailure) {
                return Column(
                  children: [
                    SheetHeader(
                        title: LocaleKeys.Drive_unit.tr(),
                        onCancelPressed: () {
                          Navigator.of(context).pop(state.selected >= 0
                              ? state.driveTypes[state.selected]
                              : null);
                        }),
                    const Divider(thickness: 1, color: border, height: 1),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            RentSheetItemm(
                              onTap: () => getDriveTypesBloc
                                  .add(GetDriveTypesSelectEvent(-1)),
                              logo: '',
                              title: LocaleKeys.all.tr(),
                              isChecked: -1 == state.selected,
                              hasDivider: true,
                            ),
                            ...List.generate(
                                state.driveTypes.length,
                                (index) => RentSheetItemm(
                                      onTap: () => getDriveTypesBloc
                                          .add(GetDriveTypesSelectEvent(index)),
                                      logo: state.driveTypes[index].logo,
                                      title: state.driveTypes[index].type,
                                      isChecked: index == state.selected,
                                      hasDivider:
                                          state.driveTypes.length - 1 != index,
                                    )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 40),
                      child: WButton(
                          onTap: () {
                            Navigator.of(context).pop(state.selected >= 0
                                ? state.driveTypes[state.selected]
                                : null);
                          },
                          text: LocaleKeys.apply.tr()),
                    ),
                  ],
                );
              }
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }

              return const Center(
                child: Text('Error'),
              );
            },
          ),
        ),
      );
}
