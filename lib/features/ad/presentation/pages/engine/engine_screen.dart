import 'package:auto/assets/colors/light.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/gas_balloon_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
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
        headerText: 'Двигатель',
        padding: const EdgeInsets.only(top: 16),
        child: BlocBuilder<PostingAdBloc, PostingAdState>(
            builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          }
          return Column(
            children: [
              ListView.builder(
                itemBuilder: (context, index) => PostingRadioItem(
                  image: state.engines[index].logo,
                  onTap: () => context.read<PostingAdBloc>().add(
                      PostingAdChooseEvent(engineId: state.engines[index].id)),
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
              const SizedBox(
                height: 13,
              ),
              if (state.gasBalloonType?.isNotEmpty ?? false) ...{
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SwitcherRow(
                      value: true,
                      onChanged: (v) => context.read<PostingAdBloc>().add(
                            PostingAdChooseEvent(
                                hasGasBalloon: true, gasBalloonType: ''),
                          ),
                      title: 'Газобаллонное оборудование'),
                ),
              } else ...{
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet<String>(
                        context: context,
                        useRootNavigator: true,
                        backgroundColor: LightThemeColors.appBarColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        clipBehavior: Clip.hardEdge,
                        builder: (context) => SelectGasBalloonTypeSheet(
                          selected: state.gasBalloonType,
                        ),
                      ).then((value) {
                        print('=>=>=>=> $value <=<=<=<=');
                        context.read<PostingAdBloc>().add(PostingAdChooseEvent(
                            hasGasBalloon: value != null && value.isNotEmpty,
                            gasBalloonType: value));
                      });
                    },
                    child: SwitcherRow(
                        value: false,
                        onChanged: (v) {},
                        title: 'Газобаллонное оборудование'),
                  ),
                )
              }
            ],
          );
        }),
      ));
}
