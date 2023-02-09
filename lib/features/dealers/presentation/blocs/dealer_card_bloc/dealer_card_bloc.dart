import 'package:auto/features/dealers/domain/entities/dealer_card_entity.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_watch_contact_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/rent_list_bloc/rent_list_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dealer_card_event.dart';

part 'dealer_card_state.dart';

part 'dealer_card_bloc.freezed.dart';

class DealerCardBloc extends Bloc<DealerCardEvent, DealerCardState> {
  final DealerUseCase dealerUseCase;
  final DealerSingleWatchContactUseCase dealerSingleWatchContactUseCase =
      DealerSingleWatchContactUseCase();

  DealerCardBloc(this.dealerUseCase) : super(DealerCardState()) {
    on<_GetResults>((event, emit) async {
      if (!event.isRefresh) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      }
      final result = await dealerUseCase(DealerParams(
          search: event.search,
          filter: DealerFilterParams(
            mark: event.mark != null ? event.mark.toString() : '',
            carType: event.carType ?? '',
            regionId: event.regionId ?? '',
          )));
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          list: result.right.results,
          next: result.right.next,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }, transformer: debounce(const Duration(milliseconds: 300)));

    on<_GetMoreResults>((event, emit) async {
      final result = await dealerUseCase(DealerParams(next: state.next));
      if (result.isRight) {
        emit(state.copyWith(
          list: [...state.list, ...result.right.results],
          next: result.right.next,
        ));
      }
    });
    // on<_GetFilter>((event, emit) async {
    //   final result = await dealerUseCase(DealerParams(
    //       filter:));

    //   if (result.isRight) {
    //     emit(state.copyWith(
    //       list: result.right.results,
    //       count: result.right.count,
    //       next: result.right.next,
    //     ));
    //   } else {
    //     emit(state.copyWith(status: FormzStatus.submissionFailure));
    //   }
    // });

    on<_WatchContact>((event, emit) async {
      await dealerSingleWatchContactUseCase.call(event.id);
    });
  }
}
