// ignore_for_file: avoid_print

import 'package:daily_calorie_calculator/app/presentation/pages/user_information_history_page.dart';
import 'package:daily_calorie_calculator/app/presentation/pages/weight_gain_result_page.dart';
import 'package:daily_calorie_calculator/app/presentation/pages/weight_loss_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../injectable.dart';
import '../stores/user_information_store.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/text_form_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final store = injector.get<UserInformationStore>();

  @override
  void dispose() {
    store.clearStore();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc9deb5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Calorias Diárias',
        ),
        actions: [
          IconButton(
            tooltip: 'Histórico',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserInformationHistoryPage(),
              ),
            ),
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    'Preencha os campos abaixo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormFieldWidget(
                    labelText: 'Peso (kg)',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe seu peso';
                      }
                      return null;
                    },
                    onChanged: (value) => store.setWeight(double.tryParse(value) ?? 0),
                  ),
                  const SizedBox(height: 12),
                  TextFormFieldWidget(
                    labelText: 'Altura (cm)',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe sua altura';
                      }
                      return null;
                    },
                    onChanged: (value) => store.setHeight(double.tryParse(value) ?? 0),
                  ),
                  const SizedBox(height: 12),
                  TextFormFieldWidget(
                    labelText: 'Idade',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe sua idade';
                      }
                      return null;
                    },
                    onChanged: (value) => store.setAge(int.tryParse(value) ?? 0),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text('Gênero', style: TextStyle(fontSize: 16)),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          activeColor: Colors.black,
                          title: const Text('Masculino'),
                          value: 'Masculino',
                          groupValue: store.gender,
                          onChanged: (value) {
                            store.setGender(value ?? '');
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          activeColor: Colors.black,
                          title: const Text('Feminino'),
                          value: 'Feminino',
                          groupValue: store.gender,
                          onChanged: (value) {
                            print('Genero selected: $value');
                            store.setGender(value ?? '');
                            print('Genero store: ${store.gender}');
                          },
                        ),
                      ),
                    ],
                  ),
                  DropdownWidget(
                    labelText: 'Nível de atividade física',
                    value: store.activityLevel,
                    items: store.activityLevels,
                    onChanged: (newValue) {
                      print('Atividade selected: $newValue');
                      store.setActivityLevel(newValue ?? '');
                      print('Atividade store: ${store.activityLevel}');
                    },
                    validator: (value) => value == null ? 'Selecione um nível de atividade' : null,
                  ),
                  const SizedBox(height: 12),
                  DropdownWidget(
                    labelText: 'Objetivo',
                    value: store.goal,
                    items: store.goals,
                    onChanged: (newValue) {
                      print('Objetivo selected: $newValue');
                      store.setGoal(newValue ?? '');
                      print('Objetivo store: ${store.goal}');
                    },
                    validator: (value) => value == null ? 'Selecione um objetivo' : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff447a37),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        store.calculateTMB();
                        store.calculateTotalCalories();
                        store.addToHistory();
                        store.saveUserInformation();

                        if (store.goal == 'Perda de peso') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WeightLossResultPage(),
                            ),
                          );
                        } else if (store.goal == 'Ganho de peso') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WeightGainResultPage(),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
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
