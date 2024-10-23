// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserInformations {
  final double weight;
  final double height;
  final int age;
  final String gender;
  final String activityLevel;
  final String goal;
  final double? calories;
  UserInformations({
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
    required this.activityLevel,
    required this.goal,
    this.calories,
  });

  @override
  String toString() {
    return 'UserInformations(weight: $weight, height: $height, age: $age, gender: $gender, activityLevel: $activityLevel, goal: $goal, calories: $calories)';
  }
}
