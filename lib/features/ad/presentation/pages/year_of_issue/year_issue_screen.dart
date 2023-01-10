import 'package:auto/features/ad/domain/entities/years/years.dart';
import 'package:auto/features/ad/presentation/bloc/year_of_issue/year_issue_bloc.dart';
import 'package:auto/features/ad/presentation/pages/year_of_issue/widget/years_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YearIssueScreen extends StatefulWidget {
  const YearIssueScreen({Key? key}) : super(key: key);

  @override
  State<YearIssueScreen> createState() => _YearIssueScreenState();
}

class _YearIssueScreenState extends State<YearIssueScreen> {
  late YearIssueBloc yearIssueBloc;
  final YearsEntity years = const YearsEntity(
    id: 1,
    yearBegin: 2012,
    yearEnd: 2020,
    modelId: 2,
  );

  @override
  void initState() {
    yearIssueBloc = YearIssueBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: yearIssueBloc,
        child: Scaffold(
            body: BlocBuilder<YearIssueBloc, YearIssueState>(
          builder: (context, state) => BaseWidget(
            hasButton: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => YearItem(
                    year: years.yearBegin + index,
                    selectedId: state.selectedId,
                    id: index),
                itemCount: years.yearEnd - years.yearBegin,
              ),
            ),
          ),
        )),
      );
}
