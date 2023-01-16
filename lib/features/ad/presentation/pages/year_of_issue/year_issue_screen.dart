import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/get_years.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/year_of_issue/year_issue_bloc.dart';
import 'package:auto/features/ad/presentation/pages/year_of_issue/widget/years_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YearIssueScreen extends StatefulWidget {
  final int modelId;
  const YearIssueScreen({required this.modelId, Key? key}) : super(key: key);

  @override
  State<YearIssueScreen> createState() => _YearIssueScreenState();
}

class _YearIssueScreenState extends State<YearIssueScreen> {
  late YearIssueBloc yearIssueBloc;

  @override
  void initState() {
    yearIssueBloc = YearIssueBloc(
        modelId: widget.modelId,
        getYearsUseCase:
            GetYearsUseCase(repository: serviceLocator<AdRepositoryImpl>()))
      ..add(YearsIssueGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: yearIssueBloc,
        child: Scaffold(
            body: BlocBuilder<YearIssueBloc, YearIssueState>(
          builder: (context, state) => BaseWidget(
            headerText: 'Год выпуска',
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context.read<PostingAdBloc>().add(PostingAdChooseEvent(
                      yearsEntity: state.yearsEntity[index]));
                },
                child: YearItem(
                  beginYear: '${state.yearsEntity[index].yearBegin}',
                  endYear: '${state.yearsEntity[index].yearEnd}',
                  isSelected:
                      (context.watch<PostingAdBloc>().state.yearsEntity?.id ??
                              -1) ==
                          state.yearsEntity[index].id,
                ),
              ),
              itemCount: state.yearsEntity.length,
            ),
          ),
        )),
      );
}
