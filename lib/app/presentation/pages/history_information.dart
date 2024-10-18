import 'package:daily_calorie_calculator/app/injectable.dart';
import 'package:daily_calorie_calculator/app/presentation/stores/article_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/local/local_data.dart';

class HistoryInformation extends StatefulWidget {
  const HistoryInformation({super.key});

  @override
  State<HistoryInformation> createState() => _HistoryInformationState();
}

class _HistoryInformationState extends State<HistoryInformation> {
  final store = injector.get<ArticleStore>();
final localData = LocalData();
  @override
  void initState() {
    super.initState();
    store.loadUserInformation(); // Carrega as informações salvas do SharedPreferences via store
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Informações'),
      ),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  initialValue: store.weight.toString(),
                  decoration: const InputDecoration(labelText: 'Peso'),
                ),
                TextFormField(
                  initialValue: store.height.toString(),
                  decoration: const InputDecoration(labelText: 'Altura'),
                ),
                TextFormField(
                  initialValue: store.age.toString(),
                  decoration: const InputDecoration(labelText: 'Idade'),
                ),
                TextFormField(
                  initialValue: store.gender ?? '',
                  decoration: const InputDecoration(labelText: 'Gênero'),
                ),
                TextFormField(
                  initialValue: store.activityLevel ?? '',
                  decoration: const InputDecoration(labelText: 'Nível de Atividade'),
                ),
                TextFormField(
                  initialValue: store.goal ?? '',
                  decoration: const InputDecoration(labelText: 'Objetivo'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
