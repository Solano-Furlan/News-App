class ArticleFilter {
  final String? searchByKeyword;
  final DateTime? searchByDate;
  final String? seachBySource;
  final bool? sortByRelevancy;
  final bool? sortByPopularity;
  final bool? sortByDate;

  ArticleFilter({
    this.searchByKeyword,
    this.searchByDate,
    this.seachBySource,
    this.sortByRelevancy,
    this.sortByDate,
    this.sortByPopularity,
  });
}
