import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comercial_event.dart';
part 'comercial_state.dart';
part 'comercial_bloc.freezed.dart';

class ComercialBloc extends Bloc<ComercialEvent, ComercialState> {
  ComercialBloc() : super(ComercialState()) {
    on<ComercialEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
