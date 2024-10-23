// ignore_for_file: avoid_print

import 'package:daily_calorie_calculator/app/data/repositories/article_repository.dart';
import 'package:daily_calorie_calculator/app/domain/models/article.dart';
import 'package:mobx/mobx.dart';

import '../../core/local/local_data.dart';
import '../../injectable.dart';
part 'article_store.g.dart';

class ArticleStore = ArticleStoreBase with _$ArticleStore;

abstract class ArticleStoreBase with Store {
  final repository = injector.get<ArticleRepository>();
  final localData = LocalData();

  @observable
  bool isLoading = false;
  @action
  void setLoading(bool value) => isLoading = value;

  @observable
  ObservableList<Article> articles = ObservableList<Article>();
  @action
  void setArticles(List<Article> value) => articles = value.asObservable();
  @computed
  List<Article> get articlesFilterGain => articles.where((article) => article.goal == 'weight_gain').toList();
  @computed
  List<Article> get articlesFilterLoss => articles.where((article) => article.goal == 'weight_loss').toList();
  @action
  Future<void> getArticles() async {
    setLoading(true);
    final response = await repository.getArticles();

    response.fold(
      (error) {},
      (success) => setArticles(success),
    );
    setLoading(false);
  }

}
