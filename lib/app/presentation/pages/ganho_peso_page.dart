import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../injectable.dart';
import '../stores/article_store.dart';

class GanhoPesoPage extends StatefulWidget {
  const GanhoPesoPage({super.key});

  @override
  State<GanhoPesoPage> createState() => _GanhoPesoPageState();
}

class _GanhoPesoPageState extends State<GanhoPesoPage> {
  final store = injector.get<ArticleStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GANHO DE PESO'),
      ),
      body: Observer(builder: (_) {
        return store.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: store.articlesFilterGain.length,
                itemBuilder: (_, index) {
                  final article = store.articlesFilterGain[index];
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
