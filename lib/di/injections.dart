import 'package:get_it/get_it.dart';
import 'package:killqwerty_flutter/core/network/dio_news_client.dart';
import 'package:killqwerty_flutter/data/data_sourses/repositories/news_repository_impl.dart';

final GetIt getIt = GetIt.instance;

Future init() async {
  getIt.registerLazySingleton(() => DioNewsClient());

  getIt.registerLazySingleton(
      () => NewsRepositoryImpl(dio: getIt())
  );
//
// // Data sources
// getIt.registerLazySingleton(
// () => ExampleRemoteDataSourceImpl(dioClient: getIt()),
// );
//
// // Repositories
// getIt.registerLazySingleton(
// () => ExampleRepositoryImpl(remoteDataSource: getIt()),
// );
//
// // Presentation / Cubit
// getIt.registerFactory(() => ExampleCubit(repository: getIt()));
}

