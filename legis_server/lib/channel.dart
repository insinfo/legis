/*import 'package:legis_server/controllers/legis_controller.dart';
import 'legis_server.dart';

class LegisServerChannel extends ApplicationChannel {
  
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    //enable CORS
    CORSPolicy.defaultPolicy.allowedOrigins = ["*"];
  }
  
  @override
  Controller get entryPoint {
    final router = Router();
    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route('legis/api/v1/legis/[:id]').link(() => LegisController());
    router.route('/').linkFunction((request) => Response.ok({'message': 'ok'}));
    return router;
  }
}
*/
