import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/domain/usecases/get_gearboxess_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/get_gearbox/get_gearboxes_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/maker_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ChooseGearbox extends StatefulWidget {
  final int selectedId;

  const ChooseGearbox({required this.selectedId, super.key});

  @override
  State<ChooseGearbox> createState() => _ChooseGearboxState();
}

class _ChooseGearboxState extends State<ChooseGearbox> {
  late GetGearboxesBloc getGearboxesBloc;

  @override
  void initState() {
    getGearboxesBloc = GetGearboxesBloc(
      selectedId: widget.selectedId,
      getGearboxesUseCase: GetGearBoxessUseCase(),
    )..add(GetGearboxesGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: getGearboxesBloc,
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 44),
          decoration:  BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
            borderRadius: const BorderRadius.vertical(
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
                        title: LocaleKeys.box.tr(),
                        onCancelPressed: () {
                          Navigator.of(context).pop(state.selected >= 0
                              ? state.gearBoxes[state.selected]
                              : null);
                        }),
                     Divider(thickness: 1, color: Theme.of(context).extension<ThemedColors>()!.divider, height: 1),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            RentSheetItemm(
                              onTap: () => getGearboxesBloc
                                  .add(GetGearboxesSelectEvent(-1)),
                              logo: '',
                              title: LocaleKeys.all.tr(),
                              isChecked: -1 == state.selected,
                              hasDivider: true,
                            ),
                            ...List.generate(
                              state.gearBoxes.length,
                              (index) => RentSheetItemm(
                                onTap: () => getGearboxesBloc
                                    .add(GetGearboxesSelectEvent(index)),
                                logo: state.gearBoxes[index].logo,
                                title: state.gearBoxes[index].type,
                                isChecked: index == state.selected  ,
                                hasDivider: state.gearBoxes.length - 1 != index,
                              ),
                            ),
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
                              ? state.gearBoxes[state.selected]
                              : null);
                        },
                        color: orange,
                        text: LocaleKeys.apply.tr(),
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
