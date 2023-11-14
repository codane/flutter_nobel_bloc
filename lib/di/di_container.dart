import 'package:dio/dio.dart';
import 'package:flutter_nobel/common/constants/nobel_api_constants.dart';
import 'package:flutter_nobel/data/data_source/remote/nobel_api_data_source.dart';
import 'package:flutter_nobel/data/repository/nobel_repository_impl.dart';
import 'package:flutter_nobel/domain/repository/nobel_repository.dart';
import 'package:flutter_nobel/domain/use_case/get_laureates_use_case.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupDependencies() {

  locator.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: NobelApiConstants.baseUrl)));
  locator.registerLazySingleton<NobelApiDataSource>(() => NobelApiDataSource(dio: locator()));
  locator.registerLazySingleton<NobelRepository>(() => NobelRepositoryImpl(nobelApiSource: locator()));
  locator.registerLazySingleton<GetLaureatesUseCase>(() => GetLaureatesUseCase(repository: locator()));
}