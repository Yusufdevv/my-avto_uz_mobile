import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/maker_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ChooseMaker extends StatefulWidget {
  final int selectedId;
  const ChooseMaker({required this.selectedId, super.key});

  @override
  State<ChooseMaker> createState() => _ChooseMakerState();
}

class _ChooseMakerState extends State<ChooseMaker> {
  late GetMakesBloc getMakesBloc;
  @override
  void initState() {
    getMakesBloc = GetMakesBloc(
      selectedMakeId: widget.selectedId,
      useCase: GetMakesUseCase(
        repository: serviceLocator<AdRepositoryImpl>(),
      ),
    )..add(GetMakesBlocEvent.getMakes());

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: getMakesBloc,
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 44),
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: BlocBuilder<GetMakesBloc, GetMakesState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionSuccess ||
                  state.status == FormzStatus.submissionFailure) {
                return Column(
                  children: [
                    SheetHeader(
                        title: 'Марка',
                        onCancelPressed: () {
                          Navigator.of(context).pop(state.selected >= 0
                              ? state.makes.results[state.selected]
                              : null);
                        }),
                    const Divider(thickness: 1, color: border, height: 1),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ...List.generate(
                                state.makes.results.length,
                                (index) => Column(
                                      children: [
                                        WScaleAnimation(
                                          onTap: () {
                                            getMakesBloc.add(GetMakesBlocEvent
                                                .changeSelected(index));
                                          },
                                          child: RentSheetItem(
                                            logo:
                                                state.makes.results[index].logo,
                                            title:
                                                state.makes.results[index].name,
                                            isChecked: state.selected == index,
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              state.makes.results.length - 1 !=
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
                            Navigator.of(context).pop(state.selected >= 0
                                ? state.makes.results[state.selected]
                                : null);
                          },
                          color: orange,
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
