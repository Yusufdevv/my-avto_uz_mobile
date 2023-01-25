import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/carcase/widget/carcase_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CarcaseScreen extends StatefulWidget {
  final int selectedBodyTypeId;
  const CarcaseScreen({required this.selectedBodyTypeId, Key? key})
      : super(key: key);

  @override
  State<CarcaseScreen> createState() => _CarcaseScreenState();
}

class _CarcaseScreenState extends State<CarcaseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: BlocBuilder<PostingAdBloc, PostingAdState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          }
          return BaseWidget(
              headerText: 'Кузов',
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => context.read<PostingAdBloc>().add(
                      PostingAdChooseEvent(
                          selectedBodyTypeId: state.bodyTypes[index].id)),
                  child: CarCaseItem(
                    selected: state.bodyTypes[index].id == state.bodyTypeId,
                    title: state.bodyTypes[index].type,
                    image: state.bodyTypes[index].logo,
                  ),
                ),
                itemCount: state.bodyTypes.length,
              ));
        },
      ));
}
