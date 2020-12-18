import 'package:dotenv/dotenv.dart' show env;

class AppConfig {
  static String storagePath = "${env['STORAGE_PATH']}/storage/legis";
  static String storageWebPath = '/storage/$storageDirectoryName';
  static String storagePathMedia = "$storagePath/medias";
  static String storageWebPathMedia = '$storageWebPath/medias';
  static String storageDirectoryName = 'legis';
  static String basePath = '/api/v1';
  static String webPathBase = "${env['WEB_PATH_BASE']}";
}
