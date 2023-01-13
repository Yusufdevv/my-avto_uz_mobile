import 'package:auto/features/common/models/ad_model.dart';
import 'package:auto/features/main/domain/usecases/get_top_ads.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'top_ad_bloc.freezed.dart';
part 'top_ad_event.dart';
part 'top_ad_state.dart';

class TopAdBloc extends Bloc<TopAdEvent, TopAdState> {
  final GetTopAdsUseCase getTopBrand;

  TopAdBloc(this.getTopBrand) : super(TopAdState()) {
    on<_GetTopAds>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getTopBrand('');

      if (result.isRight) {
        emit(state.copyWith(
            next: state.next,
            count: state.count,
            status: FormzStatus.submissionSuccess,
            topAds: result.right.results));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetMoreTopAds>((event, emit) async {
      final result = await getTopBrand('');
      if (result.isRight) {
        emit(state.copyWith(
          topAds: [...state.topAds, ...result.right.results],
          next: state.next,
          count: state.count,
        ));
      } else {}
    });
    on<_ChangeIsWish>(_onChangeIsWish);
  }

  void _onChangeIsWish(_ChangeIsWish event, Emitter<TopAdState> emit) {
    var list = <AdModel>[...state.topAds];
    final item = list.firstWhere((element) => element.id==event.id);
    final index = list.indexOf(item);
    list[index].isWishlisted = !list[index].isWishlisted;
    emit(state.copyWith(topAds: list));
  }
}
