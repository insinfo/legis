import 'package:legis_server/boot_angel.dart';
import 'package:angel_production/angel_production.dart';

dynamic main(List<String> args) {
  return Runner('ro_app_server', configureServer).run(args);
}
