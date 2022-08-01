import 'package:auto/features/posting_ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/posting_ad/year_of_issue/domain/entity/years_entity.dart';
import 'package:auto/features/posting_ad/year_of_issue/presentation/blocs/year_issue_bloc.dart';
import 'package:auto/features/posting_ad/year_of_issue/presentation/widget/years_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YearIssueScreen extends StatefulWidget {
  final VoidCallback onTap;

  const YearIssueScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<YearIssueScreen> createState() => _YearIssueScreenState();
}

class _YearIssueScreenState extends State<YearIssueScreen> {
  late YearIssueBloc yearIssueBloc;
  final List<YearsEntity> years = [
    const YearsEntity(year: '2019'),
    const YearsEntity(year: '2020'),
    const YearsEntity(year: '2021'),
    const YearsEntity(year: '2022'),
    const YearsEntity(year: '2023'),
  ];

  @override
  void initState() {
    yearIssueBloc = YearIssueBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: yearIssueBloc,
        child: Scaffold(
            body: BaseWidget(
          onTap: widget.onTap,
          child: BlocBuilder<YearIssueBloc, YearIssueState>(
            builder: (context, state) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => YearItem(
                    entity: years[index],
                    selectedId: state.selectedId,
                    id: index),
                itemCount: years.length,
              ),
            ),
          ),
        )),
      );
}
