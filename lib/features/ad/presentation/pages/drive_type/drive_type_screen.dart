import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
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
        headerText: 'Привод',
        padding: const EdgeInsets.only(top: 16),
        child: BlocBuilder<PostingAdBloc, PostingAdState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) => PostingRadioItem(
                onTap: () => context.read<PostingAdBloc>().add(
                    PostingAdChooseEvent(
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
