import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:equatable/equatable.dart';

class RemoveRadio extends Equatable {
  final Map<int, String> radios;
  final Map<int, String> additionalRadios;

  const RemoveRadio({required this.additionalRadios, required this.radios});

  @override
  List<Object?> get props => [
        radios,
        additionalRadios,
      ];
}

class RemoveSelect extends Equatable {
  final Map<int, SO> selects;
  final Map<int, SO> additionalSelects;

  const RemoveSelect({required this.additionalSelects, required this.selects});

  @override
  List<Object?> get props => [
        selects,
        additionalSelects,
      ];
}
