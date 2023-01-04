part of 'change_car_bloc.dart';

class ChangeCarState extends Equatable {
  final int selectedId;
  final int confirmId;

  const ChangeCarState({required this.selectedId, required this.confirmId});

  ChangeCarState copyWith({
    int? selectedId,
    int? confirmId,
  }) =>
      ChangeCarState(
          selectedId: selectedId ?? this.selectedId,
          confirmId: confirmId ?? this.confirmId);

  @override
  List<Object?> get props => [selectedId, confirmId];
}
