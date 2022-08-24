import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/dealers/domain/entities/dealer_card_entity.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_usecase.dart';
import 'package:bloc/bloc.dart';
 import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dealer_card_event.dart';
part 'dealer_card_state.dart';
part 'dealer_card_bloc.freezed.dart';


class DealerCardBloc extends Bloc<DealerCardEvent, DealerCardState> {
  final DealerUseCase dealerUseCase;
  DealerCardBloc(this.dealerUseCase) : super(DealerCardState()) {
    on<DealerCardEvent>((event, emit) async {
      final result = await dealerUseCase.call(NoParams());
      if(result.isRight){
        emit(state.copyWith(dealerCardEntity: result.right));
      } else {
        print('fuck');
      }
    });
  }
}
