import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auto/features/profile/domain/repositories/profile.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator.registerLazySingleton(DioSettings.new);
  serviceLocator.registerLazySingleton(
      () => ProfileRepositoryImpl(dataSource: ProfileRemoteDataSourceImpl()));
}
