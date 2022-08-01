import 'package:auto/utils/dio_settings.dart';
import 'package:get_it/get_it.dart';


final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator.registerLazySingleton(DioSettings.new);



  // serviceLocator.registerLazySingleton<GetAllCategoriesUseCases>(
  //     () => GetAllCategoriesUseCases(repository: serviceLocator()));

  // Main Screen Repository
  // serviceLocator.registerLazySingleton<MainRepository>(() =>
  //     MainRepositoryImpl(mainRemoteDataSource: MainRemoteDataSourceImpl()));

}
