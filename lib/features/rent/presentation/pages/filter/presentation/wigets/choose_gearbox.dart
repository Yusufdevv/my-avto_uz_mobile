import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/domain/usecases/get_gearboxess_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/bloc/get_gearboxes_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/maker_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ChooseGearbox extends StatefulWidget {
  const ChooseGearbox({super.key});

  @override
  State<ChooseGearbox> createState() => _ChooseGearboxState();
}

class _ChooseGearboxState extends State<ChooseGearbox> {
  late GetGearboxesBloc getGearboxesBloc;
  @override
  void initState() {
    getGearboxesBloc = GetGearboxesBloc(
      getGearboxesUseCase: GetGearBoxessUseCase(
        repository: serviceLocator<AdRepositoryImpl>(),
      ),
    )..add(GetGearboxesEvent());
    super.initState();
  }

  int selected = -1;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: getGearboxesBloc,
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 44),
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: BlocBuilder<GetGearboxesBloc, GetGearboxesState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionSuccess ||
                  state.status == FormzStatus.submissionFailure) {
                return Column(
                  children: [
                    SheetHeader(
                        title: 'Коробка',
                        onCancelPressed: () {
                          Navigator.of(context).pop(selected >= 0
                              ? '${state.gearBoxes[selected].id}'
                              : null);
                        }),
                    const Divider(thickness: 1, color: border, height: 1),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ...List.generate(
                                state.gearBoxes.length,
                                (index) => Column(
                                      children: [
                                        WScaleAnimation(
                                          onTap: () {
                                            selected = index;
                                            setState(() {});
                                          },
                                          child: RentSheetItem(
                                            logo: state.gearBoxes[index].logo,
                                            title: state.gearBoxes[index].type,
                                            isChecked: index == selected,
                                          ),
                                        ),
                                        Visibility(
                                          visible: state.gearBoxes.length - 1 !=
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
                              ? '${state.gearBoxes[selected].id}'
                              : null);
                        },
                        color: orange,
                        text: 'Применить',
                      ),
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