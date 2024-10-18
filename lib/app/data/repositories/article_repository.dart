import 'package:daily_calorie_calculator/app/domain/errors/article_error.dart';
import 'package:daily_calorie_calculator/app/domain/models/article.dart';
import 'package:dartz/dartz.dart';

abstract interface class ArticleRepository {
  Future<Either<ArticleError, List<Article>>> getArticles();
}