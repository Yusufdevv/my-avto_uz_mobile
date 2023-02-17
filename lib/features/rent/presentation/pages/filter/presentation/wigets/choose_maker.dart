import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/maker_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
    getMakesBloc = GetMakesBloc(initialId: widget.selectedId)
      ..add(GetMakesBlocEvent.getMakes());
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
            builder: (context, getMakesState) {
              if (getMakesState.status == FormzStatus.submissionSuccess ||
                  getMakesState.status == FormzStatus.submissionFailure) {
                return Column(
                  children: [
                    SheetHeader(
                        title: LocaleKeys.brand.tr(),
                        onCancelPressed: () {
                          Navigator.of(context).pop();
                        }),
                    const Divider(thickness: 1, color: border, height: 1),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ...List.generate(
                              getMakesState.makes.length,
                              (index) => Column(
                                children: [
                                  WScaleAnimation(
                                    onTap: () {
                                      getMakesBloc.add(
                                          GetMakesBlocEvent.changeSelected(
                                              getMakesState.makes[index].id));
                                    },
                                    child: RentSheetItem(
                                      logo: getMakesState.makes[index].logo,
                                      title: getMakesState.makes[index].name,
                                      isChecked: getMakesState.selectId ==
                                          getMakesState.makes[index].id,
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        getMakesState.makes.length - 1 != index,
                                    child: const Divider(
                                      thickness: 1,
                                      color: border,
                                      height: 1,
                                      indent: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: WButton(
                          onTap: () {
                            Navigator.of(context).pop(getMakesState.selectId >=
                                    0
                                ? getMakesState.makes.firstWhere((element) =>
                                    element.id == getMakesState.selectId)
                                : null);
                          },
                          color: orange,
                          text: LocaleKeys.apply.tr()),
                    ),
                  ],
                );
              }
              if (getMakesState.status == FormzStatus.submissionInProgress) {
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
