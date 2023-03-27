import 'package:http/http.dart';
import 'package:iceman_http_wrapper/iceman_http_wrapper.dart';

void main() async {
  final option =
      Options(baseUrl: 'https://jsonplaceholder.typicode.com', timeOut: 10000);
  final httpClient = HttpWrapper(option);
  final response = await httpClient.getRequest('/todos/1');

  final items = response.body;
  print(response.headers);
  print(items);
}
