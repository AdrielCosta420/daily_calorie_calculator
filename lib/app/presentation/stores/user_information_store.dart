// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:mobx/mobx.dart';

import '../../core/local/local_data.dart';
import '../../domain/models/user_informations.dart';
part 'user_information_store.g.dart';

class UserInformationStore = UserInformationStoreBase with _$UserInformationStore;

abstract class UserInformationStoreBase with Store {
  final localData = LocalData();

  @observable
  bool isLoading = false;
  @action
  void setLoading(bool value) => isLoading = value;

  @observable
  List<String> activityLevels = [
    'Sedentário',
    'Levemente ativo',
    'Moderadamente ativo',
    'Muito ativo',
  ];
  @observable
  List<String> goals = ['Perda de peso', 'Ganho de peso'];
  @observable
  List<String> genders = ['Masculino', 'Feminino'];

  @observable
  double? weight;
  @action
  void setWeight(double value) => weight = value;

  @observable
  double? height;
  @action
  void setHeight(double value) => height = value;

  @observable
  int? age;
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
  double? recommendedCalories;
  @action
  void setRecommendedCalories(double value) => recommendedCalories = value;

  @observable
  List<Map<String, dynamic>> history = [];
  @action
  Future<void> loadHistory() async {
    final String historyJson = await localData.getHistory('history');
    if (historyJson.isNotEmpty) {
      history = List<Map<String, dynamic>>.from(json.decode(historyJson));
    }
  }

  @action
  Future<void> addToHistory() async {
    if (weight != null && height != null && age != null && gender != null) {
      final entry = {
        'weight': await localData.getWeight('weight'),
        'height': await localData.getHeight('height'),
        'age': await localData.getAge('age'),
        'gender': await localData.getGender('gender'),
        'activity': await localData.getActivityLevel('activity'),
        'goal': await localData.getGoal('goal'),
        'calories': await localData.getRecommedCalories('calories'),
      };

      history.add(entry);
      await localData.setHistory('history', json.encode(history));
    }
  }

  @action
  Future<void> clearHistory() async {
    history.clear();
    await localData.removeHistory('history');
  }

  @action
  Future<void> saveUserInformation() async {
    print('Init save user information');
    await localData.setWeight('weight', weight ?? 0);
    print('PESO $weight');
    await localData.setHeight('height', height ?? 0);
    print('ALTURA $height');
    await localData.setAge('age', age ?? 0);
    print('IDADE $age');
    await localData.setGender('gender', gender ?? 'Erro ou null');
    print('GENERO $gender');
    await localData.setActivityLevel('activity', activityLevel ?? 'Erro ou null');
    print('ATIVIDADE $activityLevel');
    await localData.setGoal('goal', goal ?? 'Erro ou null');
    print('OBJETIVO $goal');
    print('Informações salvas com sucesso!');
  }

  @observable
  UserInformations? userInformations;
  @action
  void setUser(UserInformations value) => userInformations = value;
  @action
  Future<UserInformations> loadUserInformation() async {
    print('DADOS ARMAZENADOS NO SHARED:');
    setLoading(true);
    final weightLocal = await localData.getWeight('weight');
    final heightLocal = await localData.getHeight('height');
    final ageLocal = await localData.getAge('age');
    final genderLocal = await localData.getGender('gender');
    final activityLocal = await localData.getActivityLevel('activity');
    final goalLocal = await localData.getGoal('goal');
    final caloriesLocal = await localData.getRecommedCalories('calories');

    final user = UserInformations(
      weight: weightLocal,
      height: heightLocal,
      age: ageLocal,
      gender: genderLocal,
      activityLevel: activityLocal,
      goal: goalLocal,
      calories: caloriesLocal,
    );
    setUser(user);
    print(userInformations.toString());
    setLoading(false);
    return user;
  }

  @observable
  double? tmb;

  @action
  double calculateTMB() {
    if (weight == null || height == null || age == null || gender == null) {
      throw Exception('Todos os campos devem ser preenchidos para calcular a TMB.');
    }

    double tmbLocal;

    if (gender == 'Masculino') {
      tmbLocal = 88.362 + (13.397 * weight!) + (4.799 * height!) - (5.677 * age!);
    } else if (gender == 'Feminino') {
      tmbLocal = 447.593 + (9.247 * weight!) + (3.098 * height!) - (4.330 * age!);
    } else {
      return 0;
    }
    tmb = tmbLocal;
    print('TMB calculada: $tmb');
    return tmb ?? 0;
  }

  @action
  Future<double> calculateTotalCalories() async {
    double activityMultiplier;
    switch (activityLevel) {
      case 'Sedentário':
        activityMultiplier = 1.2;
        break;
      case 'Levemente ativo':
        activityMultiplier = 1.375;
        break;
      case 'Moderadamente ativo':
        activityMultiplier = 1.55;
        break;
      case 'Muito ativo':
        activityMultiplier = 1.725;
        break;
      default:
        throw Exception('Nível de atividade física não reconhecido.');
    }

    double totalCalories = (tmb ?? 0) * activityMultiplier;

    if (goal == 'Perda de peso') {
      totalCalories *= 0.8; // Reduzir 20%
    } else if (goal == 'Ganho de peso') {
      totalCalories *= 1.15; // Aumentar 15%
    }
    recommendedCalories = totalCalories;
    print('recommendedCalories.toString() ${recommendedCalories.toString()}');
    setRecommendedCalories(totalCalories);
    await localData.setRecommendCalories('calories', recommendedCalories ?? 0);
    return recommendedCalories ?? 0;
  }

  @action
  void clearStore() {
    weight = null;
    height = null;
    age = null;
    gender = null;
    activityLevel = null;
    goal = null;
  }
}
