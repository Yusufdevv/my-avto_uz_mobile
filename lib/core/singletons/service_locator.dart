import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/ad/data/datasources/ad_remote_datasource.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/car_single/data/datasource/car_single_datasource.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/comparison/data/datasources/comparison_cars_datasource.dart';
import 'package:auto/features/comparison/data/repositories/comparison_cars_repo_impl.dart';
import 'package:auto/features/profile/data/datasources/profile_datasource.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton(DioSettings.new)
    ..registerLazySingleton(
        () => ProfileRepositoryImpl(dataSource: ProfileDataSourceImpl()))
    ..registerLazySingleton(
        () => ComparisonDataSourceImpl(serviceLocator<DioSettings>().dio))
    ..registerLazySingleton(
        () => AdRemoteDataSourceImpl(serviceLocator<DioSettings>().dio))
    ..registerLazySingleton(() => ComparisonCarsRepoImpl(
        comparisonCarsDataSource: serviceLocator<ComparisonDataSourceImpl>()))
    ..registerLazySingleton(() => AdRepositoryImpl(
        remoteDataSource: serviceLocator<AdRemoteDataSourceImpl>()))
    ..registerLazySingleton(
        () => CarSingleRepositoryImpl(dataSource: CarSinglenDataSourceImpl()));
}

