import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/year_of_issue/widget/years_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class YearIssueScreenn extends StatefulWidget {
  const YearIssueScreenn({Key? key}) : super(key: key);

  @override
  State<YearIssueScreenn> createState() => _YearIssueScreennState();
}

class _YearIssueScreennState extends State<YearIssueScreenn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: BlocBuilder<PostingAdBloc, PostingAdState>(
        builder: (context, state) => BaseWidget(
          headerText: 'Год выпуска',
          child: state.status == FormzStatus.submissionInProgress
              ? const Center(child: CupertinoActivityIndicator())
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      context.read<PostingAdBloc>().add(
                          PostingAdChooseEvent(yearId: state.years![index].id));
                    },
                    child: YearItem(
                      beginYear: '${state.years![index].yearBegin}',
                      endYear: '${state.years![index].yearEnd}',
                      isSelected:
                          (state.yearId ?? -1) == state.years![index].id,
                    ),
                  ),
                  itemCount: state.years?.length ?? 0,
                ),
        ),
      ));
}
