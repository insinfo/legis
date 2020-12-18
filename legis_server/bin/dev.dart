import 'dart:io';
import 'package:legis_server/pretty_logging.dart';
import 'package:legis_server/boot_angel.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_hot/angel_hot.dart';
import 'package:logging/logging.dart';
import 'package:dotenv/dotenv.dart' show env, load;

dynamic main() async {
  // Watch the config/ and web/ directories for changes, and hot-reload the server.
  hierarchicalLoggingEnabled = true;

  load('.env');

  final hot = HotReloader(() async {
    final logger = Logger.detached('legis_server')
      ..level = Level.ALL
      ..onRecord.listen(prettyLog);
    final app = Angel(logger: logger);
    await app.configure(configureServer);
    return app;
  }, [
    Directory('config'),
    Directory('lib'),
    Directory('lib/controller'),
  ]);

  final port = int.tryParse(env['APP_HOST_PORT']);
  final host = env['APP_HOST'];

  await hot.startServer(host, port); //127.0.0.1 3000
  print('startServer on http://$host:$port');
}
