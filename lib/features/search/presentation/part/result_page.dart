import 'package:auto/features/common/widgets/paginator2.dart';
import 'package:auto/features/search/presentation/bloc/search_results/search_result_bloc.dart';
import 'package:auto/features/search/presentation/widgets/all_commertial_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchResultBloc, SearchResultState>(
        builder: (context, state) => Paginator2(
          hasMoreToFetch: state.count > state.list.length,
          itemBuilder: (context, index) => AllCommercialItem(
            commercialItemEntity: state.list[index],
          ),
          fetchMoreFunction: () {},
          status: state.status,
          itemCount: state.list.length,
          errorWidget: const SizedBox(),
          loadingLabel: 'Загрузка данных...',
        ),
      );
}
