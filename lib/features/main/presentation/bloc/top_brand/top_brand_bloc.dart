import 'package:auto/features/main/data/models/top_brand.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_brand_event.dart';

part 'top_brand_state.dart';

part 'top_brand_bloc.freezed.dart';

class TopBrandBloc extends Bloc<TopBrandEvent, TopBrandState> {
  final GetTopBrandUseCase getBrands;

  TopBrandBloc(this.getBrands) : super(TopBrandState()) {
    on<_GetBrand>((event, emit) async {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));
      final result = await getBrands('');
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            brands: result.right.results,
            next: result.right.next,
            count: result.right.count));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetMoreBrand>((event, emit) async {
      final result = await getBrands(state.next);
      if (result.isRight) {
        emit(
          state.copyWith(
            brands: [
              ...state.brands,
              ...result.right.results,
            ],
            next: result.right.next,
            count: result.right.count,
          ),
        );
      } else {}
    });
  }
}
