import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/search/presentation/bloc/search_results/search_result_bloc.dart';
import 'package:auto/features/search/presentation/widgets/commercial_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchResultBloc, SearchResultState>(
        builder: (context, state) => Paginator(
          hasMoreToFetch: state.count > state.list.length,
          itemBuilder: (context, index) => CommercialItem(
            entity: state.list[index],
          ),
          fetchMoreFunction: () {},
          paginatorStatus: PaginatorStatus.PAGINATOR_LOADING,
          itemCount: state.list.length,
          errorWidget: const SizedBox(),
        ),
      );
}
