class ArticleError implements Exception {
  final String message;
  final String error;

  ArticleError({required this.message, required this.error});
}
