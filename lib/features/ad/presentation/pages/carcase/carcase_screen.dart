import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class BodyTypeScreen extends StatefulWidget {
  const BodyTypeScreen({Key? key}) : super(key: key);

  @override
  State<BodyTypeScreen> createState() => _BodyTypeScreenState();
}

class _BodyTypeScreenState extends State<BodyTypeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<PostingAdBloc, PostingAdState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            }
            return BaseWidget(
              headerText: LocaleKeys.body_type.tr(),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => PostingRadioItem(
                  onTap: () => context.read<PostingAdBloc>().add(
                      PostingAdChooseEvent(
                          selectedBodyTypeId: state.bodyTypes[index].id)),
                  selected: state.bodyTypes[index].id == state.bodyTypeId,
                  title: state.bodyTypes[index].type,
                  image: state.bodyTypes[index].logo,
                ),
                itemCount: state.bodyTypes.length,
              ),
            );
          },
        ),
      );
}
