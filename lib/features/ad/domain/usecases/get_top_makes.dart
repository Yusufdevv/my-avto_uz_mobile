import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

// class GetTopMakesUseCase
//     extends UseCase<GenericPagination<MakeEntity>, String> {
//   final AdRepository repository;

//   GetTopMakesUseCase({required this.repository});

//   @override
//   Future<Either<Failure, GenericPagination<MakeEntity>>> call(String params) =>
//       repository.getTopMakes(next: params);
// }
