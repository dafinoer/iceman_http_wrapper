import 'model/service_argument.dart';

abstract class BaseHttpWrapper<T> {
  Future<T> getRequest(String path, {ServiceArgument? serviceArgument});
  Future<T> postRequest(String path, {ServiceArgument? serviceArgument});
}
