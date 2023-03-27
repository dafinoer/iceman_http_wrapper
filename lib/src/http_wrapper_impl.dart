import 'package:iceman_http_wrapper/src/errors/wrapper_failuer.dart';
import 'package:iceman_http_wrapper/src/options.dart';

import 'base_http_wrapper.dart';
import 'package:http/http.dart' as http;

import 'model/service_argument.dart';

class HttpWrapper implements BaseHttpWrapper<http.Response> {
  final Options _options;

  final http.Client _httpClient;

  HttpWrapper._(this._options, this._httpClient);

  factory HttpWrapper(Options options) => HttpWrapper._(
        options,
        http.Client(),
      );

  @override
  Future<http.Response> getRequest(
    String path, {
    ServiceArgument? serviceArgument,
  }) async {
    try {
      final uri = Uri.https(_options.host, path, serviceArgument?.query);
      final response = await _httpClient
          .get(uri)
          .timeout(Duration(milliseconds: _options.timeOut));

      if (response.statusCode > 400 && response.statusCode < 500) {
        throw ClientError(response.statusCode, 'Client Error');
      } else if (response.statusCode > 500) {
        throw ServerError(response.statusCode, 'Error from Server');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> postRequest(
    String path, {
    ServiceArgument? serviceArgument,
  }) async {
    try {
      final uri = Uri.https(_options.host, path);
      final response = await _httpClient
          .post(
            uri,
            body: serviceArgument?.payLoad,
            headers: serviceArgument?.header,
          )
          .timeout(Duration(milliseconds: _options.timeOut));

      if (response.statusCode > 400 && response.statusCode < 500) {
        throw ClientError(response.statusCode, 'Client Error');
      } else if (response.statusCode > 500) {
        throw ServerError(response.statusCode, 'Error from Server');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
