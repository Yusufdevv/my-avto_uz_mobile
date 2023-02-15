import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/features/edit_ad/presentation/bloc/posting_ad/edit_ad_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DriveTypeScreen extends StatefulWidget {
  const DriveTypeScreen({Key? key}) : super(key: key);

  @override
  State<DriveTypeScreen> createState() => _DriveTypeScreenState();
}

class _DriveTypeScreenState extends State<DriveTypeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: BaseWidget(
        headerText: LocaleKeys.Drive_unit.tr(),
        padding: const EdgeInsets.only(top: 16),
        child: BlocBuilder<EditAdBloc, EditAdState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => PostingRadioItem(
                onTap: () => context.read<EditAdBloc>().add(
                    EditAdChooseEvent(
                        driveTypeId: state.driveTypes[index].id)),
                title: state.driveTypes[index].type,
                image: state.driveTypes[index].logo,
                selected: state.driveTypeId == state.driveTypes[index].id,
              ),
              itemCount: state.driveTypes.length,
            );
          },
        ),
      ));
}
