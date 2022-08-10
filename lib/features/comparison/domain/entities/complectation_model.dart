import 'package:auto/features/comparison/domain/entities/complectation_parameters_model.dart';

class Complectation {
  final String parameterName;
  final int id;
  final List<ComplectationParameters> complectationParameters;
  Complectation(
      {required this.parameterName,
      required this.id,
      required this.complectationParameters});
}
