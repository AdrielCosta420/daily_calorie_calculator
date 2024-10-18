import 'package:daily_calorie_calculator/app/injectable.dart';
import 'package:daily_calorie_calculator/app_widget.dart';
import 'package:flutter/material.dart';

void main() {
  setupInjector();
  runApp(const AppWidget());
}
