import 'dart:convert';
import 'package:angel_framework/angel_framework.dart';
import 'package:collection/collection.dart';
import 'package:legis_core/legis_core.dart';
import 'package:legis_server/legis_server.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DynamicRestController {
  static void all(RequestContext req, ResponseContext res) async {
    try {
      //await req.parseBody();
      //final Map<String, dynamic> payload = req.bodyAsMap;
      final Map<String, dynamic> queryParameters = req.queryParameters;
      //final Map<String, dynamic> params = req.params;

      final collection = queryParameters['collection'].toString();
      var result;

      final filterByMap = jsonDecode(queryParameters['filterByMap'].toString());

      //data = await db.collection(collection).find(filterByMap).toList();
      final pipeline = AggregationPipelineBuilder();

      //.addStage(Group(id: const Field('cust_id'), fields: {'total': Sum(const Field('amount'))}))

      if (queryParameters.containsKey('filterByMap')) {
        //Match(where.eq('status', 'A').map['\$query'])
        pipeline.addStage(Match(filterByMap));
      }

      if (queryParameters.containsKey('limit')) {
        final limit = int.tryParse(queryParameters['limit'].toString());
        final offset = int.tryParse(queryParameters['offset'].toString());
        pipeline.addStage(Match(where.skip(offset).limit(limit)));
      }

      result = await DbCollection(db, collection).aggregateToStream(pipeline.build()).toList();

      final json = CoreUtils.myJsonEncode(result);
      // res.contentType = MediaType('application', 'json');
      res.headers['Content-Type'] = 'application/json;charset=utf-8';
      //res.headers['total-records'] = re.totalRecords.toString();
      res.write(json);
    } catch (e, s) {
      throw AngelHttpException.badRequest(message: '$e $s');
    }
  }

  static void findFirstBy(RequestContext req, ResponseContext res) async {
    try {
      //await req.parseBody();
      //final Map<String, dynamic> filterMap = req.bodyAsMap;
      //final Map<String, dynamic> params = req.params;
      final Map<String, dynamic> queryParameters = req.queryParameters;
      final collection = queryParameters['collection'].toString();

      Map<String, dynamic> re;
      if (queryParameters.containsKey('filterByMap')) {
        final filterByMap = jsonDecode(queryParameters['filterByMap'].toString());
        re = await db.collection(collection).findOne(filterByMap);
      } else if (queryParameters.containsKey('filterById')) {
        final filterById = queryParameters['filterById'].toString();
        re = await db.collection(collection).findOne(where.id(ObjectId.fromHexString(filterById)));
      }

      final json = CoreUtils.myJsonEncode(re);
      res.headers['Content-Type'] = 'application/json;charset=utf-8';
      res.write(json);
    } catch (e, s) {
      throw AngelHttpException.badRequest(message: '$e $s');
    }
  }

  static void deleteBy(RequestContext req, ResponseContext res) async {
    try {
      //await req.parseBody();
      //final Map<String, dynamic> filterMap = req.bodyAsMap;
      //final Map<String, dynamic> params = req.params;
      final Map<String, dynamic> queryParameters = req.queryParameters;
      final collection = queryParameters['collection'].toString();

      if (queryParameters.containsKey('filterByMap')) {
        final filterByMap = jsonDecode(queryParameters['filterByMap'].toString());
        await db.collection(collection).remove(filterByMap);
      } else if (queryParameters.containsKey('filterById')) {
        final filterById = queryParameters['filterById'].toString();
        await db.collection(collection).remove(where.id(ObjectId.fromHexString(filterById)));
      }

      final json = CoreUtils.myJsonEncode({'message': StatusMessage.SUCCESS});
      res.headers['Content-Type'] = 'application/json;charset=utf-8';
      res.write(json);
    } catch (e, s) {
      throw AngelHttpException.badRequest(message: '$e $s');
    }
  }

  static void create(RequestContext req, ResponseContext res) async {
    try {
      await req.parseBody();
      final Map<String, dynamic> data = req.bodyAsMap;
      //final Map<String, dynamic> params = req.params;
      final Map<String, dynamic> queryParameters = req.queryParameters;
      final collection = queryParameters['collection'].toString();
      await db.collection(collection).insert(data);
      res.headers['Content-Type'] = 'application/json;charset=utf-8';
      res.json({'message': StatusMessage.SUCCESS});
    } catch (e, s) {
      throw AngelHttpException.badRequest(message: '$e $s');
    }
  }

  static void updateBy(RequestContext req, ResponseContext res) async {
    try {
      await req.parseBody();
      final Map<String, dynamic> data = req.bodyAsMap;
      //final Map<String, dynamic> params = req.params;
      final Map<String, dynamic> queryParameters = req.queryParameters;
      final collection = queryParameters['collection'].toString();

      if (queryParameters.containsKey('filterByMap')) {
        final filterByMap = jsonDecode(queryParameters['filterByMap'].toString());
        final Map<String, dynamic> item = await db.collection(collection).findOne(filterByMap);
        final mesclado = CombinedMapView([data, item]);
        await db.collection(collection).save(mesclado);
      } else if (queryParameters.containsKey('filterById')) {
        final filterById = queryParameters['filterById'].toString();
        final Map<String, dynamic> item =
            await db.collection(collection).findOne(where.id(ObjectId.fromHexString(filterById)));
        final mesclado = CombinedMapView([data, item]);
        await db.collection(collection).save(mesclado);
      }

      res.headers['Content-Type'] = 'application/json;charset=utf-8';
      res.json({'message': StatusMessage.SUCCESS});
    } catch (e, s) {
      throw AngelHttpException.badRequest(message: '$e $s');
    }
  }
}
