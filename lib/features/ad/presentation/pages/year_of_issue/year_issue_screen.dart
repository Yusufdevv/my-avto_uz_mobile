import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/year_of_issue/widget/years_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
            headerText: LocaleKeys.year_of_issue.tr(),
            child: state.status == FormzStatus.submissionInProgress
                ? const Center(child: CupertinoActivityIndicator())
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        context.read<PostingAdBloc>().add(PostingAdChooseEvent(
                            selectedYear: state.yearEntity!.years[index]));
                      },
                      child: YearItem(
                        year: '${state.yearEntity?.years[index]}',
                        isSelected: state.selectedYear ==
                            state.yearEntity!.years[index],
                      ),
                    ),
                    itemCount: state.yearEntity?.years.length ?? 0,
                  ),
          ),
        ),
      );
}
