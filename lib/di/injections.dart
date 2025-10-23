import 'package:get_it/get_it.dart';
import 'package:killqwerty_flutter/core/network/dio_news_client.dart';
import 'package:killqwerty_flutter/data/data_sourses/interactor/news_interactor.dart';
import 'package:killqwerty_flutter/data/data_sourses/repositories/news_repository_impl.dart';
import 'package:killqwerty_flutter/domain/repositories/news/news_repository.dart';

final GetIt getIt = GetIt.instance;

Future init() async {
  getIt.registerLazySingleton<DioNewsClient>(() => DioNewsClient());

  getIt.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(dio: getIt())
  );

  getIt.registerLazySingleton<NewsInteractor>(
      () => NewsInteractor(repository: getIt())
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

