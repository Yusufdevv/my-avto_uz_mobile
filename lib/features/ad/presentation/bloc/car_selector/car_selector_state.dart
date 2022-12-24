part of 'car_selector_bloc.dart';

class SelectedCarItems {
  final int selectedId;
  final int confirmId;

  const SelectedCarItems({required this.confirmId, required this.selectedId});

  SelectedCarItems copyWith({
    int? selectedId,
    int? confirmId
  }) =>
      SelectedCarItems(
          confirmId: confirmId ?? this.confirmId,
          selectedId: selectedId ?? this.selectedId
      );

  List<Object> get props => [selectedId, confirmId];
}
