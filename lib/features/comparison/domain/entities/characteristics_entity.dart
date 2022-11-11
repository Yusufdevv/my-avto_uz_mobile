import 'package:auto/features/comparison/domain/entities/chracteristics_parameters_entity.dart';

class Characteristics {
  final String parameterName;
  final int id;
  final List<CharacteristicsParameters> comparisonParameters;
  Characteristics({
    required this.parameterName,
    required this.id,
    required this.comparisonParameters,
  });
}
