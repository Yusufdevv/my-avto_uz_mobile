import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class GenerationScreen extends StatefulWidget {
  const GenerationScreen({Key? key}) : super(key: key);

  @override
  State<GenerationScreen> createState() => _GenerationScreenState();
}

class _GenerationScreenState extends State<GenerationScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          headerText: LocaleKeys.generation.tr(),
          padding: const EdgeInsets.only(top: 16),
          child: BlocBuilder<PostingAdBloc, PostingAdState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.generations.isEmpty) {
                return const Center(child: Text('no data'));
              }

              return ListView.builder(
                itemBuilder: (context, index) => PostingRadioItem(
                    onTap: () => context.read<PostingAdBloc>().add(
                        PostingAdChooseEvent(
                            generationId: state.generations[index].id)),
                    image: state.generations[index].logo,
                    selected: state.generationId == state.generations[index].id,
                    title: state.generations[index].name),
                itemCount: state.generations.length,
              );
            },
          ),
        ),
      );
}
