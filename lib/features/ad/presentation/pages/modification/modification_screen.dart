import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ModificationScreen extends StatefulWidget {
  const ModificationScreen({required this.noData, Key? key}) : super(key: key);

  final VoidCallback noData;

  @override
  State<ModificationScreen> createState() => _ModificationScreenState();
}

class _ModificationScreenState extends State<ModificationScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          headerText: LocaleKeys.modification.tr(),
          padding: const EdgeInsets.only(top: 16),
          child: BlocConsumer<PostingAdBloc, PostingAdState>(
            listener: (context, state) {
              if (state.modifications.isEmpty &&
                  state.getModificationStatus ==
                      FormzStatus.submissionSuccess) {
                widget.noData();
              }
            },
            builder: (context, state) {
              if (state.getModificationStatus ==
                  FormzStatus.submissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.modifications.isEmpty) {
                return const Center(child: Text('No Modifications available'));
              }
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => PostingRadioItem(
                  image: '',
                  selected:
                      state.modifications[index].id == state.modification?.id,
                  onTap: () {
                    context.read<PostingAdBloc>().add(PostingAdChooseEvent(
                        modification: state.modifications[index]));
                  },
                  title:
                      'Volume ${state.modifications[index].volume} Power (${state.modifications[index].power})',
                ),
                itemCount: state.modifications.length,
                shrinkWrap: true,
              );
            },
          ),
        ),
      );
}
