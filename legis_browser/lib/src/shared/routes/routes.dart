import 'package:angular_router/angular_router.dart';
import 'package:legis/src/shared/routes/route_paths.dart';
import 'package:legis/src/modules/editor/pages/editor_page.template.dart' as editor_template;
import 'package:legis/src/modules/home/pages/home_page.template.dart' as home_template;

class Routes {
  static final home = RouteDefinition(
    routePath: RoutePaths.home,
    component: home_template.HomePageNgFactory,
  );

  static final editor = RouteDefinition(
    routePath: RoutePaths.editor,
    component: editor_template.EditorPageNgFactory,
    useAsDefault: true,
  );

  static final all = <RouteDefinition>[
    editor,
    home,
    /*RouteDefinition.redirect(
      path: 'home',
      redirectTo: RoutePaths.home.toUrl(),
    ),*/
  ];
}
