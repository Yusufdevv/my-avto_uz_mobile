part of 'show_pop_up_bloc.dart';

@immutable
abstract class ShowPopUpEvent {}

class ShowPopUp extends ShowPopUpEvent {
  final String message;
  final bool isSucces;
  final bool dismissible;
  ShowPopUp(
      {required this.message, required this.isSucces, this.dismissible = true});
}

class HidePopUp extends ShowPopUpEvent {}
