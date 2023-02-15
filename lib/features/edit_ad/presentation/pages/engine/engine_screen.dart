import 'package:auto/assets/colors/light.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/gas_balloon_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/switcher_row_as_button_also.dart';
import 'package:auto/features/edit_ad/presentation/bloc/posting_ad/edit_ad_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class EngineScreen extends StatefulWidget {
  const EngineScreen({Key? key}) : super(key: key);

  @override
  State<EngineScreen> createState() => _EngineScreenState();
}

class _EngineScreenState extends State<EngineScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          headerText: LocaleKeys.generation.tr(),
          padding: const EdgeInsets.only(top: 16),
          child: BlocBuilder<EditAdBloc, EditAdState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              return Column(
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => PostingRadioItem(
                      image: state.engines[index].logo,
                      onTap: () => context.read<EditAdBloc>().add(
                          EditAdChooseEvent(
                              engineId: state.engines[index].id)),
                      title: state.engines[index].type,
                      selected: state.engineId == state.engines[index].id,
                    ),
                    itemCount: state.engines.length,
                    shrinkWrap: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      thickness: 1,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  const SizedBox(height: 13),
                  if (state.gasBalloonType?.isNotEmpty ?? false) ...{
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SwitcherRow(
                          value: true,
                          onChanged: (v) => context.read<EditAdBloc>().add(
                                EditAdChooseEvent(
                                    hasGasBalloon: true, gasBalloonType: ''),
                              ),
                          title: LocaleKeys.gas_ballon_equipment.tr()),
                    ),
                  } else ...{
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SwitcherRowAsButtonAlso(
                        value: false,
                        onChanged: (v) => context
                            .read<EditAdBloc>()
                            .add(EditAdChooseEvent(hasGasBalloon: v)),
                        onTap: () {
                          showModalBottomSheet<String>(
                            context: context,
                            useRootNavigator: true,
                            backgroundColor: LightThemeColors.appBarColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            clipBehavior: Clip.hardEdge,
                            builder: (context) => SelectGasBalloonTypeSheet(
                              selected: state.gasBalloonType,
                            ),
                          ).then(
                            (value) {
                              context.read<EditAdBloc>().add(
                                  EditAdChooseEvent(
                                      hasGasBalloon:
                                          value != null && value.isNotEmpty,
                                      gasBalloonType: value));
                            },
                          );
                        },
                        title: LocaleKeys.gas_ballon_equipment.tr(),
                      ),
                    )
                  }
                ],
              );
            },
          ),
        ),
      );
}
