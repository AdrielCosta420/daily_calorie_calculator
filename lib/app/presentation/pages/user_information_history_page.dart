// ignore_for_file: use_build_context_synchronously

import 'package:daily_calorie_calculator/app/injectable.dart';
import 'package:daily_calorie_calculator/app/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../stores/user_information_store.dart';

class UserInformationHistoryPage extends StatefulWidget {
  const UserInformationHistoryPage({super.key});

  @override
  State<UserInformationHistoryPage> createState() => _UserInformationHistoryPageState();
}

class _UserInformationHistoryPageState extends State<UserInformationHistoryPage> {
  final store = injector.get<UserInformationStore>();

  @override
  void initState() {
    store.loadUserInformation();
    store.loadHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc9deb5),
      appBar: AppBar(
        title: const Text('Histórico de Cálculos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _showConfirmationDialog(context),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        if (store.history.isEmpty) {
          return const Center(child: Text('Nenhum histórico disponível.'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: store.history.length,
          itemBuilder: (context, index) {
            final entry = store.history[index];
            var calorie = NumberFormat('#,##0.00').format(entry['calories']);
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Peso:',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        Text(' ${entry['weight']}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Altura:',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        Text('${entry['height']}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Idade:',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        Text('${entry['age']}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Genêro:',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        Text('${entry['gender']}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nível de atividade:',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        Text('${entry['activity']}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Objetivo:',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        Text('${entry['goal']}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Calorias Recomendadas:',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        Text(calorie),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Ao clicar em confirmar, você perderá todos os dados do seu Histórico.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                await store.clearHistory();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}
