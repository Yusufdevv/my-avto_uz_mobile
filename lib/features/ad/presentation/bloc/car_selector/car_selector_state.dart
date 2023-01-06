part of 'car_selector_bloc.dart';

class SelectedCarItems {
  final int selectedId;
  final int confirmId;
  final String name;
  final String imageUrl;

  const SelectedCarItems(
      {required this.confirmId,
      required this.selectedId,
      required this.name,
      required this.imageUrl});

  SelectedCarItems copyWith(
          {int? selectedId, int? confirmId, String? name, String? imageUrl}) =>
      SelectedCarItems(
        confirmId: confirmId ?? this.confirmId,
        selectedId: selectedId ?? this.selectedId,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  List<Object> get props => [selectedId, confirmId];
}
