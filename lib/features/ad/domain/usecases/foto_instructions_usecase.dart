import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/foto_instruction_entity.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';

class PhotoInstructionsUseCase
    extends UseCase<List<FotoInstructionEntity>, NoParams> {
  final AdRepository repository;
  PhotoInstructionsUseCase({required this.repository});
  @override
  Future<Either<Failure, List<FotoInstructionEntity>>> call(NoParams params) async {
    return await repository.getFotoInstructions();
  }
}
