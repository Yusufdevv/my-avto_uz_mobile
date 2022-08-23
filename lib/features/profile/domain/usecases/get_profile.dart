// import 'package:auto/core/error/failures.dart';
// import 'package:auto/core/usecases/usecase.dart';
// import 'package:auto/features/profile/data/datasources/network/profile_data_source.dart';
// import 'package:auto/features/profile/data/models/profile_item.dart';
// import 'package:auto/features/profile/domain/entities/profile_item.dart';
// import 'package:auto/features/profile/domain/repositories/profile.dart';
// import 'package:auto/features/profile/presentation/widgets/profile_data.dart';
// import 'package:auto/utils/either.dart';
//
// class GetProfileUseCase extends UseCase<ProfileItemModel, NoParams> {
//   final ProfileDataSourceImpl sectionSimpleRepository;
//   GetProfileUseCase({required this.sectionSimpleRepository});
//
//   @override
//   Future<Either<Failure, ProfileItemModel>> call(NoParams params)async {
//     var result =await  sectionSimpleRepository.getProfile();
//     if(result.isRight){
//       return result.right;
//     }else {
//       return result.left;
//     }
//   }
//   }
