import 'package:auto/features/dealers/data/repositories/dealer_repository.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dealer_card_bloc/dealer_card_bloc.dart';
import '../widgets/dealer_card.dart';

class DealersList extends StatefulWidget {
  DealersList({Key? key}) : super(key: key);

  @override
  State<DealersList> createState() => _DealersListState();
}

class _DealersListState extends State<DealersList> {
  late DealerCardBloc dealerCardBloc;

  @override
  void initState() {
   dealerCardBloc=DealerCardBloc(DealerUseCase())..add(DealerCardEvent.getList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) => BlocProvider.value(value: dealerCardBloc,

        child: Scaffold(
          body: BlocBuilder<DealerCardBloc, DealerCardState>(
            builder: (context, state) {
              print(state.dealerCardEntity.length);
              return ListView.separated(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              itemBuilder: (context, index) => DealerCard(
                dealerType: state.dealerCardEntity[index].type,
                dealerName: state.dealerCardEntity[index].name,
                dealerImageUrl: state.dealerCardEntity[index].avatar,
                quantityOfCars: state.dealerCardEntity[index].carCount,
                contractCode:
                    '+998 ${state.dealerCardEntity[index].phone.substring(0, 2)}',
                contractNumber:
                    state.dealerCardEntity[index].phone.substring(3, 9),
                contactTo: state.dealerCardEntity[index].contactTo,
                contactFrom: state.dealerCardEntity[index].contactFrom,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: state.dealerCardEntity.length,
            );
            },
          ),
        ),
      );
}
