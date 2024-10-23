// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleStore on ArticleStoreBase, Store {
  Computed<List<Article>>? _$articlesFilterGainComputed;

  @override
  List<Article> get articlesFilterGain => (_$articlesFilterGainComputed ??=
          Computed<List<Article>>(() => super.articlesFilterGain,
              name: 'ArticleStoreBase.articlesFilterGain'))
      .value;
  Computed<List<Article>>? _$articlesFilterLossComputed;

  @override
  List<Article> get articlesFilterLoss => (_$articlesFilterLossComputed ??=
          Computed<List<Article>>(() => super.articlesFilterLoss,
              name: 'ArticleStoreBase.articlesFilterLoss'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: 'ArticleStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$articlesAtom =
      Atom(name: 'ArticleStoreBase.articles', context: context);

  @override
  ObservableList<Article> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(ObservableList<Article> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$getArticlesAsyncAction =
      AsyncAction('ArticleStoreBase.getArticles', context: context);

  @override
  Future<void> getArticles() {
    return _$getArticlesAsyncAction.run(() => super.getArticles());
  }

  late final _$ArticleStoreBaseActionController =
      ActionController(name: 'ArticleStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArticles(List<Article> value) {
    final _$actionInfo = _$ArticleStoreBaseActionController.startAction(
        name: 'ArticleStoreBase.setArticles');
    try {
      return super.setArticles(value);
    } finally {
      _$ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
articles: ${articles},
articlesFilterGain: ${articlesFilterGain},
articlesFilterLoss: ${articlesFilterLoss}
    ''';
  }
}
