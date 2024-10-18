import 'package:daily_calorie_calculator/app/presentation/stores/article_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../injectable.dart';

class PerdaPesoPage extends StatefulWidget {
  const PerdaPesoPage({super.key});

  @override
  State<PerdaPesoPage> createState() => _PerdaPesoPageState();
}

class _PerdaPesoPageState extends State<PerdaPesoPage> {
  final store = injector.get<ArticleStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERDA DE PESO'),
      ),
      body: Observer(builder: (_) {
        return store.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: store.articlesFilterLoss.length,
                itemBuilder: (_, index) {
                  final article = store.articlesFilterLoss[index];
                  return Container(
                    height: 500,
                    child: Column(
                      children: [
                        Text(article.id.toString()),
                        Text(article.author ?? ''),
                        Text(article.content ?? ''),
                        Text(article.goal ?? ''),
                        Text(article.title ?? ''),
                      ],
                    ),
                  );
                });
      }),
    );
  }
}
