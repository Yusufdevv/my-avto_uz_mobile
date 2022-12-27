import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/domain/usecases/get_drive_types_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/get_drive_types/get_drive_types_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/maker_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/marks_sheet_all_select_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ChooseDriveType extends StatefulWidget {
  const ChooseDriveType({super.key});

  @override
  State<ChooseDriveType> createState() => _ChooseDriveTypeState();
}

class _ChooseDriveTypeState extends State<ChooseDriveType> {
  late GetDriveTypesBloc getMakesBloc;
  @override
  void initState() {
    getMakesBloc = GetDriveTypesBloc(
      getBodyTypeUseCase: GetDriveTypesUseCase(
        repository: serviceLocator<AdRepositoryImpl>(),
      ),
    )..add(GetDriveTypesEvent());
    super.initState();
  }

  int selected = -1;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: getMakesBloc,
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
                        title: 'Привод',
                        onCancelPressed: () {
                          Navigator.of(context).pop(selected >= 0
                              ? '${state.driveTypes[selected].id}'
                              : null);
                        }),
                    const Divider(thickness: 1, color: border, height: 1),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ...List.generate(
                                state.driveTypes.length,
                                (index) => Column(
                                      children: [
                                        WScaleAnimation(
                                          onTap: () {
                                            selected = index;
                                            setState(() {});
                                          },
                                          child: RentSheetItem(
                                            logo: state.driveTypes[index].logo,
                                            title: state.driveTypes[index].type,
                                            isChecked: index == selected,
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              state.driveTypes.length - 1 !=
                                                  index,
                                          child: const Divider(
                                            thickness: 1,
                                            color: border,
                                            height: 1,
                                            indent: 16,
                                          ),
                                        ),
                                      ],
                                    )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 50),
                      child: WButton(
                          onTap: () {
                            Navigator.of(context).pop(selected >= 0
                                ? '${state.driveTypes[selected].id}'
                                : null);
                          },
                          text: 'Применить'),
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
