import 'package:daily_calorie_calculator/app/presentation/stores/article_store.dart';
import 'package:daily_calorie_calculator/app/presentation/stores/user_information_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../injectable.dart';
import '../widgets/article_widget.dart';

class WeightLossResultPage extends StatefulWidget {
  const WeightLossResultPage({super.key});

  @override
  State<WeightLossResultPage> createState() => WeightLossResultPageState();
}

class WeightLossResultPageState extends State<WeightLossResultPage> {
  final store = injector.get<ArticleStore>();
  final user = injector.get<UserInformationStore>();
  @override
  void initState() {
    store.getArticles();
    user.loadUserInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc9deb5),
      appBar: AppBar(),
      body: Observer(builder: (_) {
        var totalKcal = NumberFormat('#,##0.00').format(user.recommendedCalories);
        if (store.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return store.articles.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Para alcançar seu objetivo, esse será o total de Calorias a serem consumidos por dia: ',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '$totalKcal kcal',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Confira abaixo artigos relacionados',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ...store.articlesFilterLoss.map((article) {
                        return ArticleWidget(
                          autor: article.author!,
                          content: article.content!,
                          goal: article.goal!,
                          title: article.title!,
                          tags: article.tags!,
                          imageUrl: article.imageUrl!,
                          publishedDate: DateTime.parse(article.publishedDate!),
                        );
                      }),
                    ],
                  ),
                )
              : const Center(
                  child: Text('Aconteceu um erro ao buscar por antigos.'),
                );
        }
      }),
    );
  }
}
