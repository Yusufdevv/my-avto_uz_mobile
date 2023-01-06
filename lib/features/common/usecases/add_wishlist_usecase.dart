import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/repository/add_wishlist_repository.dart';

class AddWishlistUseCase extends UseCase<void, int> {
  final AddWishlistRepository repo;

  AddWishlistUseCase({required this.repo});

  @override
  Future<Either<Failure, void>> call(int params) async =>
      await repo.addWishlist(params);
}

class RemoveWishlistUseCase extends UseCase<void, int> {
  final AddWishlistRepository repo;

  RemoveWishlistUseCase({required this.repo});

  @override
  Future<Either<Failure, void>> call(int params) async =>
      await repo.removeWishlist(params);
}
