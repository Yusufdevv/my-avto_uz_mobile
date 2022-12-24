import 'package:equatable/equatable.dart';

class SearchParam extends Equatable {
  final String icon;
  final bool isSelected;
  final String title;
  final String apiKey;
  const SearchParam({
    required this.apiKey,
    required this.icon,
    required this.isSelected,
    required this.title,
  });
  SearchParam changeSelected() => SearchParam(
      apiKey: apiKey, icon: icon, isSelected: !isSelected, title: title);

  @override
  List<Object?> get props => [
        apiKey,
        icon,
        isSelected,
        title,
      ];
}

enum ParamKey { airConditioner, babyChair, fullTank, cleneCar }
