part of 'searched_bloc.dart';


@Freezed()
class SearchState with _$SearchState {
  factory SearchState({
    @Default(FormzStatus.pure) FormzStatus status
})=_SearchState;
}
