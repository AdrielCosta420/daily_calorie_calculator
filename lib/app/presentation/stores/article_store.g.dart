// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleStore on ArticleStoreBase, Store {
  Computed<List<Article>>? _$articlesFilterGainComputed;

  @override
  List<Article> get articlesFilterGain => (_$articlesFilterGainComputed ??=
          Computed<List<Article>>(() => super.articlesFilterGain,
              name: 'ArticleStoreBase.articlesFilterGain'))
      .value;
  Computed<List<Article>>? _$articlesFilterLossComputed;

  @override
  List<Article> get articlesFilterLoss => (_$articlesFilterLossComputed ??=
          Computed<List<Article>>(() => super.articlesFilterLoss,
              name: 'ArticleStoreBase.articlesFilterLoss'))
      .value;
  Computed<List<String>>? _$activityLevelsComputed;

  @override
  List<String> get activityLevels => (_$activityLevelsComputed ??=
          Computed<List<String>>(() => super.activityLevels,
              name: 'ArticleStoreBase.activityLevels'))
      .value;
  Computed<List<String>>? _$goalsComputed;

  @override
  List<String> get goals =>
      (_$goalsComputed ??= Computed<List<String>>(() => super.goals,
              name: 'ArticleStoreBase.goals'))
          .value;
  Computed<List<String>>? _$gendersComputed;

  @override
  List<String> get genders =>
      (_$gendersComputed ??= Computed<List<String>>(() => super.genders,
              name: 'ArticleStoreBase.genders'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: 'ArticleStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$articlesAtom =
      Atom(name: 'ArticleStoreBase.articles', context: context);

  @override
  ObservableList<Article> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(ObservableList<Article> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$weightAtom =
      Atom(name: 'ArticleStoreBase.weight', context: context);

  @override
  double get weight {
    _$weightAtom.reportRead();
    return super.weight;
  }

  @override
  set weight(double value) {
    _$weightAtom.reportWrite(value, super.weight, () {
      super.weight = value;
    });
  }

  late final _$heightAtom =
      Atom(name: 'ArticleStoreBase.height', context: context);

  @override
  double get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(double value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  late final _$ageAtom = Atom(name: 'ArticleStoreBase.age', context: context);

  @override
  int get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(int value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  late final _$genderAtom =
      Atom(name: 'ArticleStoreBase.gender', context: context);

  @override
  String? get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String? value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  late final _$activityLevelAtom =
      Atom(name: 'ArticleStoreBase.activityLevel', context: context);

  @override
  String? get activityLevel {
    _$activityLevelAtom.reportRead();
    return super.activityLevel;
  }

  @override
  set activityLevel(String? value) {
    _$activityLevelAtom.reportWrite(value, super.activityLevel, () {
      super.activityLevel = value;
    });
  }

  late final _$goalAtom = Atom(name: 'ArticleStoreBase.goal', context: context);

  @override
  String? get goal {
    _$goalAtom.reportRead();
    return super.goal;
  }

  @override
  set goal(String? value) {
    _$goalAtom.reportWrite(value, super.goal, () {
      super.goal = value;
    });
  }

  late final _$recommendedCaloriesAtom =
      Atom(name: 'ArticleStoreBase.recommendedCalories', context: context);

  @override
  String get recommendedCalories {
    _$recommendedCaloriesAtom.reportRead();
    return super.recommendedCalories;
  }

  @override
  set recommendedCalories(String value) {
    _$recommendedCaloriesAtom.reportWrite(value, super.recommendedCalories, () {
      super.recommendedCalories = value;
    });
  }

  late final _$getArticlesAsyncAction =
      AsyncAction('ArticleStoreBase.getArticles', context: context);

  @override
  Future<void> getArticles() {
    return _$getArticlesAsyncAction.run(() => super.getArticles());
  }

  late final _$saveUserInformationAsyncAction =
      AsyncAction('ArticleStoreBase.saveUserInformation', context: context);

  @override
  Future<void> saveUserInformation() {
    return _$saveUserInformationAsyncAction
        .run(() => super.saveUserInformation());
  }

  late final _$loadUserInformationAsyncAction =
      AsyncAction('ArticleStoreBase.loadUserInformation', context: context);

  @override
  Future<void> loadUserInformation() {
    return _$loadUserInformationAsyncAction
        .run(() => super.loadUserInformation());
  }

  late final _$ArticleStoreBaseActionController =
      ActionController(name: 'ArticleStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArticles(List<Article> value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setArticles');
    try {
      return super.setArticles(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWeight(double value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setWeight');
    try {
      return super.setWeight(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHeight(double value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setHeight');
    try {
      return super.setHeight(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAge(int value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setAge');
    try {
      return super.setAge(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGender(String value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setGender');
    try {
      return super.setGender(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActivityLevel(String value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setActivityLevel');
    try {
      return super.setActivityLevel(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGoal(String value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setGoal');
    try {
      return super.setGoal(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRecommendedCalories(String value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setRecommendedCalories');
    try {
      return super.setRecommendedCalories(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
articles: ${articles},
weight: ${weight},
height: ${height},
age: ${age},
gender: ${gender},
activityLevel: ${activityLevel},
goal: ${goal},
recommendedCalories: ${recommendedCalories},
articlesFilterGain: ${articlesFilterGain},
articlesFilterLoss: ${articlesFilterLoss},
activityLevels: ${activityLevels},
goals: ${goals},
genders: ${genders}
    ''';
  }
}
