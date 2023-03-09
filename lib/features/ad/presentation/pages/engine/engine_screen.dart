import 'package:auto/assets/colors/light.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/gas_balloon_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/switcher_row_as_button_also.dart';
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
          headerText: LocaleKeys.motor.tr(),
          padding: const EdgeInsets.only(top: 16),
          child: BlocBuilder<PostingAdBloc, PostingAdState>(
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
                      onTap: () => context.read<PostingAdBloc>().add(
                          PostingAdChooseEvent(engineId: state.engines[index])),
                      title: state.engines[index].type,
                      selected: state.engine?.id == state.engines[index].id,
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
                  if (state.engine?.type != 'electric') ...{
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SwitcherRowAsButtonAlso(
                        value: state.gasEquipmentId != null &&
                            state.gasEquipmentId != -1,
                        onChanged: (v) => context.read<PostingAdBloc>().add(
                            PostingAdChooseEvent(
                                gasEquipmentId: v ? null : -1)),
                        onTap: () {
                          showModalBottomSheet<int>(
                            context: context,
                            useRootNavigator: true,
                            backgroundColor: LightThemeColors.appBarColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            clipBehavior: Clip.hardEdge,
                            builder: (context) => SelectGasBalloonTypeSheet(
                              selected: state.gasEquipmentId,
                              gasEquipments: state.gasEquipments,
                            ),
                          ).then(
                            (value) {
                              context
                                  .read<PostingAdBloc>()
                                  .add(PostingAdChooseEvent(
                                    gasEquipmentId: value,
                                  ));
                            },
                          );
                        },
                        title: LocaleKeys.gas_ballon_equipment.tr(),
                      ),
                    ),
                  }
                ],
              );
            },
          ),
        ),
      );
}
