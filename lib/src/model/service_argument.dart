class ServiceArgument {
  final Map<String, String>? header;
  final Map<String, String>? query;
  final Map<String, String>? payLoad;

  ServiceArgument({this.header, this.payLoad, this.query});

  factory ServiceArgument.queryParam(Map<String, String> queryParam,
          {Map<String, String>? headers}) =>
      ServiceArgument(query: queryParam, header: headers);

  factory ServiceArgument.payload(Map<String, String> body,
          {Map<String, String>? headers}) =>
      ServiceArgument(payLoad: body, header: headers);
}
