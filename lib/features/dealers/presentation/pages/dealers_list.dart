import 'package:auto/features/dealers/domain/usecases/dealer_usecase.dart';
import 'package:auto/features/dealers/presentation/bloc/dealer_card_bloc/dealer_card_bloc.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealersList extends StatefulWidget {
  const DealersList({Key? key}) : super(key: key);

  @override
  State<DealersList> createState() => _DealersListState();
}

class _DealersListState extends State<DealersList> {
  late DealerCardBloc dealerCardBloc;

  @override
  void initState() {
    dealerCardBloc = DealerCardBloc(DealerUseCase())
      ..add(DealerCardEvent.getResults(isRefresh: false, search: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: dealerCardBloc,
        child: Scaffold(
          body: BlocBuilder<DealerCardBloc, DealerCardState>(
            builder: (context, state) => ListView.separated(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              itemBuilder: (context, index) => DealerCard(
                dealerType: state.list[index].slug,
                dealerName: state.list[index].name,
                dealerImageUrl: state.list[index].avatar,
                quantityOfCars: state.list[index].carCount,
                contractCode: state.list[index].phoneNumber.isEmpty
                    ? ''
                    : '+998 ${state.list[index].phoneNumber.substring(0, 2)}',
                contractNumber: state.list[index].phoneNumber.isEmpty
                    ? ''
                    : state.list[index].phoneNumber.substring(2, 9),
                contactTo: state.list[index].contactTo,
                contactFrom: state.list[index].contactFrom,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: state.list.length,
            ),
          ),
        ),
      );
}
