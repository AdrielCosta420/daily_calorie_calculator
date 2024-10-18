import 'package:daily_calorie_calculator/app/presentation/pages/history_information.dart';
import 'package:daily_calorie_calculator/app/presentation/stores/article_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../injectable.dart';

class CalorieCalculatorScreen extends StatefulWidget {
  @override
  _CalorieCalculatorScreenState createState() => _CalorieCalculatorScreenState();
}

class _CalorieCalculatorScreenState extends State<CalorieCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();

  final store = injector.get<ArticleStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Calorias Diárias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  // Campo de Peso
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Peso (kg)'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe seu peso';
                      }
                      return null;
                    },
                    onChanged: (value) => store.setWeight(double.tryParse(value) ?? 0),
                  ),

                  // Campo de Altura
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Altura (cm)'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe sua altura';
                      }
                      return null;
                    },
                    onChanged: (value) => store.setHeight(double.tryParse(value) ?? 0),
                  ),

                  // Campo de Idade
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Idade'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe sua idade';
                      }
                      return null;
                    },
                    onChanged: (value) => store.setAge(int.tryParse(value) ?? 0),
                  ),

                  // Seletor de Gênero
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text('Gênero', style: TextStyle(fontSize: 16)),
                  ),
                  RadioListTile<String>(
                    title: const Text('Masculino'),
                    value: 'Masculino',
                    groupValue: store.gender,
                    onChanged: (value) {
                      store.setGender(value ?? '');
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Feminino'),
                    value: 'Feminino',
                    groupValue: store.gender,
                    onChanged: (value) => store.setGender(value ?? ''),
                  ),

                  // Nível de Atividade Física
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Nível de atividade física'),
                    value: store.activityLevel,
                    onChanged: (newValue) => store.setActivityLevel(newValue ?? ''),
                    validator: (value) => value == null ? 'Selecione um nível de atividade' : null,
                    items: store.activityLevels
                        .map((level) => DropdownMenuItem(
                              value: level,
                              child: Text(level),
                            ))
                        .toList(),
                  ),

                  // Objetivo
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Objetivo'),
                    value: store.goal,
                    onChanged: (newValue) => store.goal = newValue ?? '',
                    validator: (value) => value == null ? 'Selecione um objetivo' : null,
                    items: store.goals
                        .map((goal) => DropdownMenuItem(
                              value: goal,
                              child: Text(goal),
                            ))
                        .toList(),
                  ),

                  // Botão para calcular
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      // if (_formKey.currentState?.validate() ?? false) {
                      //   store.saveUserInformation();
                      // }
                      store.loadUserInformation();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryInformation()));
                    },
                    child: const Text('Enviar'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
