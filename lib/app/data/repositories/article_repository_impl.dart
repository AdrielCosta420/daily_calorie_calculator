import 'package:daily_calorie_calculator/app/core/api/api_request.dart';
import 'package:daily_calorie_calculator/app/data/repositories/article_repository.dart';
import 'package:daily_calorie_calculator/app/domain/errors/article_error.dart';
import 'package:daily_calorie_calculator/app/domain/models/article.dart';
import 'package:dartz/dartz.dart';

import '../../injectable.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final api = injector.get<ApiRequest>();

  @override
  Future<Either<ArticleError, List<Article>>> getArticles() async {
    try {
      final response = await api.get(url: 'cd5cc92e412c4058c90d');
      final articles = <Article>[];

      for (var article in response['articles']) {
        articles.add(Article.fromMap(article));
      }

      return Right(articles);
    } on ArticleError catch (e) {
      throw Left(
        ArticleError(message: e.message, error: e.error),
      );
    } on Exception catch (e) {
      throw Left(
        ArticleError(
          message: 'Erro desconhecido ao buscar por Artigos.',
          error: e.toString(),
        ),
      );
    }
  }
}
