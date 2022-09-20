import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/rent/domain/entities/rent_entity.dart';
import 'package:auto/features/rent/domain/repositories/rent_repository.dart';
import 'package:auto/utils/either.dart';
import 'package:equatable/equatable.dart';

class RentUseCase
    implements UseCase<GenericPagination<RentEntity>, RentParams> {
  final RentRepository repository;

  RentUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<RentEntity>>> call(
          RentParams params) =>
      repository.rent(query: params.query, next: params.next);
}

class RentParams extends Equatable {
  final String query;
  final String? next;

  const RentParams({required this.query, this.next});

  @override
  List<Object?> get props => [
        query,
        next,
      ];
}
