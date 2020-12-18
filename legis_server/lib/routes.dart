import 'package:angel_framework/angel_framework.dart';
import 'package:angel_static/angel_static.dart';
import 'package:dotenv/dotenv.dart';
import 'package:file/file.dart';
import 'package:legis_server/controllers/authentication_controller.dart';
import 'package:legis_server/controllers/dynamic_rest_controller.dart';
import 'package:legis_server/controllers/legis_controller.dart';
import 'package:legis_server/middleware/auth_middleware.dart';
import 'app_config.dart';

///arquivo de rotas
AngelConfigurer configureServer(FileSystem fileSystem) {
  return (Angel app) async {
    // Render `views/hello.jl` when a user visits the application root.
    //app.get('/', (req, res) => res.render('hello'));

    app.get('/', (req, res) => res.write('Legis Server '));

    //rotas publicas
    app.group(AppConfig.basePath, (router) {
      router.get('/', (req, res) => res.write('Legis Server ${AppConfig.basePath}'));
      //rotas de autenticação
      router.post('/auth/login', AuthenticationController.authenticate);
      router.post('/auth/check', AuthenticationController.checkToken);
      router.post('/auth/validateqrcode', AuthenticationController.validateQrCode);

      //rotas leis
      router.get('/leis', LegisController.all);
      router.get('/leis/:id', LegisController.getById);
      router.post('/leis', LegisController.create);
      router.put('/leis', LegisController.update);

      //rotas dynamic REST API
      router.get('/rest', DynamicRestController.all);
      router.get('/rest', DynamicRestController.findFirstBy);
      router.post('/rest', DynamicRestController.create);
      router.put('/rest', DynamicRestController.updateBy);
      router.delete('/rest', DynamicRestController.deleteBy);
    });

    //rotas privadas
    app.group(AppConfig.basePath, (router) {
      //rotas CRUD usuarios
      /* router.get('/usuarios', UsuarioController.all);
      router.get('/usuarios/:id', UsuarioController.getById);
      router.post('/usuarios', UsuarioController.create);
      router.put('/usuarios/:id', UsuarioController.update);
      router.delete('/usuarios', UsuarioController.deleteAll);*/
    }, middleware: [AuthMiddleware().handleRequestCrud]);

    // Mount static server at web in development.
    // The `CachingVirtualDirectory` variant of `VirtualDirectory` also sends `Cache-Control` headers.
    //
    // In production, however, prefer serving static files through NGINX or a
    // similar reverse proxy.
    //
    // Read the following two sources for documentation:
    // * https://medium.com/the-angel-framework/serving-static-files-with-the-angel-framework-2ddc7a2b84ae
    // * https://github.com/angel-dart/static
    if (!app.environment.isProduction) {
      //STORAGE_PATH=C:\wamp64\www\  /var/www/html/
      final vDir = VirtualDirectory(
        app,
        fileSystem,
        source: fileSystem.directory(env['STORAGE_PATH']), //web
      );
      app.fallback(vDir.handleRequest);
    }

    // Throw a 404 if no route matched the request.
    app.fallback((req, res) => throw AngelHttpException.notFound());

    // Set our application up to handle different errors.
    //
    // Read the following for documentation:
    // * https://github.com/angel-dart/angel/wiki/Error-Handling

    final oldErrorHandler = app.errorHandler;
    app.errorHandler = (e, req, res) async {
      if (req.accepts('text/html', strict: true)) {
        if (e.statusCode == 404 && req.accepts('text/html', strict: true)) {
          await res.render('error', {'message': 'No file exists at ${req.uri}.'});
        } else {
          await res.render('error', {'message': e.message});
        }
      } else {
        return await oldErrorHandler(e, req, res);
      }
    };
  };
}
