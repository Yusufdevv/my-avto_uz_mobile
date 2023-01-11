import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/repository/add_wishlist_repository.dart';
import 'package:auto/features/rent/domain/usecases/rent_list_usecase.dart';
import 'package:equatable/equatable.dart';

class AddWishlistUseCase extends UseCase<void, int> {
  final AddWishlistRepository repo;

  AddWishlistUseCase({required this.repo});

  @override
  Future<Either<Failure, void>> call(int params) async =>
      await repo.addWishlist(params);
}

class RemoveWishlistUseCase extends UseCase<void, Params> {
  final AddWishlistRepository repo;

  RemoveWishlistUseCase({required this.repo});

  @override
  Future<Either<Failure, void>> call(Params params) async =>
      await repo.removeWishlist(params.id, params.endpoint);
}
class Params extends Equatable {
  final String endpoint;
  final int id;

 const Params({required this.endpoint, required this.id});
  @override
  List<Object?> get props => [];
}
