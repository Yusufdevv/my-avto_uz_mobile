part of 'show_pop_up_bloc.dart';

class ShowPopUpState extends Equatable {
  final String message;
  final bool showPopUp;
  final bool isSucces;
  const ShowPopUpState({
    required this.message,
    required this.showPopUp,
    required this.isSucces,
  });

  ShowPopUpState copyWith({
    String? message,
    bool? showPopUp,
    bool? isSucces,
  }) =>
      ShowPopUpState(
        message: message ?? this.message,
        showPopUp: showPopUp ?? this.showPopUp,
        isSucces: isSucces ?? this.isSucces,
      );
  @override
  List<Object?> get props => [
    showPopUp,
    message,
    isSucces
  ];
}
