class Options {
  final String baseUrl;
  final int timeOut;

  static Options? _instance;

  Options._({
    required this.baseUrl,
    required this.timeOut,
  });

  factory Options({required String baseUrl, int? timeOut}) {
    _instance ??= Options._(
      baseUrl: baseUrl,
      timeOut: timeOut ?? 5000,
    );

    return _instance!;
  }

  String get host => Uri.parse(baseUrl).host;
}
