import 'package:flutter/material.dart';

import 'app/presentation/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Calorie Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: CalorieCalculatorScreen(),
    );
  }
}
