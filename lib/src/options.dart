class Options {
  final String baseUrl;
  final int timeOut;

  Options({
    required this.baseUrl,
    required this.timeOut,
  });

  String get host => Uri.parse(baseUrl).host;
}
