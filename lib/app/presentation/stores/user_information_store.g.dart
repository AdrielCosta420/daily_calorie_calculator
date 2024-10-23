// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserInformationStore on UserInformationStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'UserInformationStoreBase.isLoading', context: context);

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

  late final _$activityLevelsAtom =
      Atom(name: 'UserInformationStoreBase.activityLevels', context: context);

  @override
  List<String> get activityLevels {
    _$activityLevelsAtom.reportRead();
    return super.activityLevels;
  }

  @override
  set activityLevels(List<String> value) {
    _$activityLevelsAtom.reportWrite(value, super.activityLevels, () {
      super.activityLevels = value;
    });
  }

  late final _$goalsAtom =
      Atom(name: 'UserInformationStoreBase.goals', context: context);

  @override
  List<String> get goals {
    _$goalsAtom.reportRead();
    return super.goals;
  }

  @override
  set goals(List<String> value) {
    _$goalsAtom.reportWrite(value, super.goals, () {
      super.goals = value;
    });
  }

  late final _$gendersAtom =
      Atom(name: 'UserInformationStoreBase.genders', context: context);

  @override
  List<String> get genders {
    _$gendersAtom.reportRead();
    return super.genders;
  }

  @override
  set genders(List<String> value) {
    _$gendersAtom.reportWrite(value, super.genders, () {
      super.genders = value;
    });
  }

  late final _$weightAtom =
      Atom(name: 'UserInformationStoreBase.weight', context: context);

  @override
  double? get weight {
    _$weightAtom.reportRead();
    return super.weight;
  }

  @override
  set weight(double? value) {
    _$weightAtom.reportWrite(value, super.weight, () {
      super.weight = value;
    });
  }

  late final _$heightAtom =
      Atom(name: 'UserInformationStoreBase.height', context: context);

  @override
  double? get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(double? value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  late final _$ageAtom =
      Atom(name: 'UserInformationStoreBase.age', context: context);

  @override
  int? get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(int? value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  late final _$genderAtom =
      Atom(name: 'UserInformationStoreBase.gender', context: context);

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
      Atom(name: 'UserInformationStoreBase.activityLevel', context: context);

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

  late final _$goalAtom =
      Atom(name: 'UserInformationStoreBase.goal', context: context);

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

  late final _$recommendedCaloriesAtom = Atom(
      name: 'UserInformationStoreBase.recommendedCalories', context: context);

  @override
  double? get recommendedCalories {
    _$recommendedCaloriesAtom.reportRead();
    return super.recommendedCalories;
  }

  @override
  set recommendedCalories(double? value) {
    _$recommendedCaloriesAtom.reportWrite(value, super.recommendedCalories, () {
      super.recommendedCalories = value;
    });
  }

  late final _$historyAtom =
      Atom(name: 'UserInformationStoreBase.history', context: context);

  @override
  List<Map<String, dynamic>> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(List<Map<String, dynamic>> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$userInformationsAtom =
      Atom(name: 'UserInformationStoreBase.userInformations', context: context);

  @override
  UserInformations? get userInformations {
    _$userInformationsAtom.reportRead();
    return super.userInformations;
  }

  @override
  set userInformations(UserInformations? value) {
    _$userInformationsAtom.reportWrite(value, super.userInformations, () {
      super.userInformations = value;
    });
  }

  late final _$tmbAtom =
      Atom(name: 'UserInformationStoreBase.tmb', context: context);

  @override
  double? get tmb {
    _$tmbAtom.reportRead();
    return super.tmb;
  }

  @override
  set tmb(double? value) {
    _$tmbAtom.reportWrite(value, super.tmb, () {
      super.tmb = value;
    });
  }

  late final _$loadHistoryAsyncAction =
      AsyncAction('UserInformationStoreBase.loadHistory', context: context);

  @override
  Future<void> loadHistory() {
    return _$loadHistoryAsyncAction.run(() => super.loadHistory());
  }

  late final _$addToHistoryAsyncAction =
      AsyncAction('UserInformationStoreBase.addToHistory', context: context);

  @override
  Future<void> addToHistory() {
    return _$addToHistoryAsyncAction.run(() => super.addToHistory());
  }

  late final _$clearHistoryAsyncAction =
      AsyncAction('UserInformationStoreBase.clearHistory', context: context);

  @override
  Future<void> clearHistory() {
    return _$clearHistoryAsyncAction.run(() => super.clearHistory());
  }

  late final _$saveUserInformationAsyncAction = AsyncAction(
      'UserInformationStoreBase.saveUserInformation',
      context: context);

  @override
  Future<void> saveUserInformation() {
    return _$saveUserInformationAsyncAction
        .run(() => super.saveUserInformation());
  }

  late final _$loadUserInformationAsyncAction = AsyncAction(
      'UserInformationStoreBase.loadUserInformation',
      context: context);

  @override
  Future<UserInformations> loadUserInformation() {
    return _$loadUserInformationAsyncAction
        .run(() => super.loadUserInformation());
  }

  late final _$calculateTotalCaloriesAsyncAction = AsyncAction(
      'UserInformationStoreBase.calculateTotalCalories',
      context: context);

  @override
  Future<double> calculateTotalCalories() {
    return _$calculateTotalCaloriesAsyncAction
        .run(() => super.calculateTotalCalories());
  }

  late final _$UserInformationStoreBaseActionController =
      ActionController(name: 'UserInformationStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWeight(double value) {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.setWeight');
    try {
      return super.setWeight(value);
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHeight(double value) {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.setHeight');
    try {
      return super.setHeight(value);
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAge(int value) {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.setAge');
    try {
      return super.setAge(value);
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGender(String value) {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.setGender');
    try {
      return super.setGender(value);
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActivityLevel(String value) {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.setActivityLevel');
    try {
      return super.setActivityLevel(value);
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGoal(String value) {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.setGoal');
    try {
      return super.setGoal(value);
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRecommendedCalories(double value) {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.setRecommendedCalories');
    try {
      return super.setRecommendedCalories(value);
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(UserInformations value) {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double calculateTMB() {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.calculateTMB');
    try {
      return super.calculateTMB();
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearStore() {
    final _$actionInfo = _$UserInformationStoreBaseActionController.startAction(
        name: 'UserInformationStoreBase.clearStore');
    try {
      return super.clearStore();
    } finally {
      _$UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
activityLevels: ${activityLevels},
goals: ${goals},
genders: ${genders},
weight: ${weight},
height: ${height},
age: ${age},
gender: ${gender},
activityLevel: ${activityLevel},
goal: ${goal},
recommendedCalories: ${recommendedCalories},
history: ${history},
userInformations: ${userInformations},
tmb: ${tmb}
    ''';
  }
}
