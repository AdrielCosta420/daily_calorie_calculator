import 'package:daily_calorie_calculator/app/data/repositories/article_repository.dart';
import 'package:daily_calorie_calculator/app/data/repositories/article_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'core/api/api_request.dart';
import 'core/api/dio_request_impl.dart';
import 'presentation/stores/article_store.dart';
import 'presentation/stores/user_information_store.dart';

final injector = GetIt.I;

void setupInjector() {
  injector.registerLazySingleton<ApiRequest>(() => DioRequestImpl());
  injector.registerLazySingleton<ArticleRepository>(() => ArticleRepositoryImpl());
  injector.registerLazySingleton<ArticleStore>(() => ArticleStore());
  injector.registerLazySingleton<UserInformationStore>(() => UserInformationStore());
}
