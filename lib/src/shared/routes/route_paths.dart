import 'package:angular_router/angular_router.dart';

class RoutePaths {
  static final home = RoutePath(path: 'home');
  static final editor = RoutePath(path: 'editor');
}

int getId(Map<String, String> parameters) {
  final id = parameters['id'];
  return id == null ? null : int.tryParse(id);
}

String getParam(Map<String, String> parameters, String paramName) {
  return parameters[paramName];
}
