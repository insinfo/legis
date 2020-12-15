import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:legis/src/shared/routes/route_paths.dart';
import 'package:legis/src/shared/routes/routes.dart';

// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
    selector: 'my-app',
    styleUrls: [
      'app_component.css',
      'package:angular_components/app_layout/layout.scss.css',
    ],
    templateUrl: 'app_component.html',
    directives: [
      coreDirectives,
      materialDirectives,
      formDirectives,
      routerDirectives,
    ],
    exports: [Routes, RoutePaths])
class AppComponent {}
