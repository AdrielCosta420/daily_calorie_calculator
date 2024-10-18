

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

  @computed
  List<String> get activityLevels => [
        'Sedentário',
        'Levemente ativo',
        'Moderadamente ativo',
        'Muito ativo',
      ];

  @computed
  List<String> get goals => ['Perda de peso', 'Ganho de peso'];
  @computed
  List<String> get genders => ['Masculino', 'Feminino'];

  @observable
  double weight = 0.0;
  @action
  void setWeight(double value) => weight = value;

  @observable
  double height = 0.0;
  @action
  void setHeight(double value) => height = value;

  @observable
  int age = 0;
  @action
  void setAge(int value) => age = value;

  @observable
  String? gender;
  @action
  void setGender(String value) => gender = value;

  @observable
  String? activityLevel;
  @action
  void setActivityLevel(String value) => activityLevel = value;

  @observable
  String? goal;
  @action
  void setGoal(String value) => goal = value;

  @observable
  String recommendedCalories = '';
  @action
  void setRecommendedCalories(String value) => recommendedCalories = value;

  @action
  Future<void> saveUserInformation() async {
    await localData.setWeight('weight', weight.toString());
    await localData.setHeight('height', height.toString());
    await localData.setAge('age', age);
    await localData.setGender('gender', gender ?? '');
    await localData.setActivityLevel('activity', activityLevel ?? '');
    await localData.setGoal('goal', goal ?? '');
    print('Informações salvas com sucesso!');
  }

  @action
  Future<void> loadUserInformation() async {
    setWeight(double.tryParse(await localData.getWeight('weight')) ?? 0.0);
    // print('DADOS ARMAZENADOS NO SHARED:');
    // print('PESO ${double.tryParse(await localData.getWeight('weight'))}');
    setHeight(double.tryParse(await localData.getHeight('height')) ?? 0.0);
    // print('ALTURA ${double.tryParse(await localData.getHeight('height'))}');

    setAge(await localData.getAge('age'));
    // print('IDADE ${localData.getAge('age')}');
    setGender(await localData.getGender('gender'));
    // print('GENERO ${localData.getAge('gender')}');

    setActivityLevel(await localData.getActivityLevel('activity'));
    // print('ATIVIDADE ${localData.getAge('activity')}');

    setGoal(await localData.getGoal('goal'));
    // print('OBJETIVO ${localData.getAge('goal')}');

    // print('Informações carregadas com sucesso!');
  }

  // @computed
  // UserInformations get informations => UserInformations(
  //       weight: weight,
  //       height: height,
  //       age: age,
  //       gender: gender,
  //       activityLevel: activityLevel ?? '',
  //       goal: goal ?? '',
  //     );
}
