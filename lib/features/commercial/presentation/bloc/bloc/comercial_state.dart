part of 'comercial_bloc.dart';

@freezed
class ComercialState with _$ComercialState {
  factory ComercialState({
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _ComercialState;
}
