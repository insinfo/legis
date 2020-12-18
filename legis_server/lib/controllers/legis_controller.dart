import 'package:angel_framework/angel_framework.dart';
import 'package:legis_server/repositories/legis_repository.dart';
import 'package:legis_core/legis_core.dart';

class LegisController {
  static void all(RequestContext req, ResponseContext res) async {
    // try {
    //await req.parseBody();
    //final Map<String, dynamic> payload = req.bodyAsMap;
    // print('JornalController@all');
    final Map<String, dynamic> payload = req.queryParameters;
    final repository = LegisRepository();
    final re = await repository.getAllAsMap(Filtros.fromMap(payload));
    final json = CoreUtils.myJsonEncode(re);
    // res.contentType = MediaType('application', 'json');
    res.headers['Content-Type'] = 'application/json;charset=utf-8';
    //res.headers['total-records'] = re.totalRecords.toString();
    res.write(json);
    // } catch (e, s) {
    //   throw AngelHttpException.badRequest(message: '$e $s');
    // }
  }

  static void getById(RequestContext req, ResponseContext res) async {
    try {
      //await req.parseBody();
      //final Map<String, dynamic> payload = req.bodyAsMap;
      final Map<String, dynamic> params = req.params;
      if (!params.containsKey('id')) {
        throw AngelHttpException.badRequest(message: "Id é obrigatorio. :)");
      }
      final repository = LegisRepository();
      final re = await repository.getByIdAsMap(params['id'].toString());
      final json = CoreUtils.myJsonEncode(re);
      res.headers['Content-Type'] = 'application/json;charset=utf-8';
      res.write(json);
    } catch (e, s) {
      throw AngelHttpException.badRequest(message: '$e $s');
    }
  }

  static void create(RequestContext req, ResponseContext res) async {
    try {
      await req.parseBody();
      final Map<String, dynamic> payload = req.bodyAsMap;
      final repository = LegisRepository();
      await repository.createFromMap(payload);
      res.headers['Content-Type'] = 'application/json;charset=utf-8';
      res.json({'message': StatusMessage.SUCCESS});
    } catch (e, s) {
      throw AngelHttpException.badRequest(message: '$e $s');
    }
  }

  static void update(RequestContext req, ResponseContext res) async {
    try {
      await req.parseBody();
      final Map<String, dynamic> payload = req.bodyAsMap;
      final Map<String, dynamic> params = req.params;
      final repository = LegisRepository();
      await repository.updateFromMap(params['id'].toString(), payload);
      res.headers['Content-Type'] = 'application/json;charset=utf-8';
      res.json({'message': StatusMessage.SUCCESS});
    } catch (e, s) {
      throw AngelHttpException.badRequest(message: '$e $s');
    }
  }
}
