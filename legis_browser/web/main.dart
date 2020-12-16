import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:legis/src/shared/repositories/repository_base.dart';

import 'package:legis/src/modules/app/app_component.template.dart' as ng;

import 'main.template.dart' as self;

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

@GenerateInjector([
  routerProvidersHash, // You can use routerProviders in production
  ClassProvider(RepositoryBase),
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  initDateFormat();
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}

void initDateFormat() {
  initializeDateFormatting('pt_BR', null);
  Intl.defaultLocale = 'pt_BR';
}
