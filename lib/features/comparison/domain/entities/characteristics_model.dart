import 'chracteristics_parameters_model.dart';

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
