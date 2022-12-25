part of 'show_pop_up_bloc.dart';

@immutable
abstract class ShowPopUpEvent {}

class ShowPopUp extends ShowPopUpEvent {
  final String message;
  final bool isSucces;
  ShowPopUp({required this.message, required this.isSucces});
}

class HidePopUp extends ShowPopUpEvent {}
