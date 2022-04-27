class SearchResponse {
  final String search;
  final List<String> results;
  final List<String> links;

  SearchResponse({
    required this.search,
    required this.links,
    required this.results,
  });

  static var empty = SearchResponse(search: '', links: [], results: []);
}
