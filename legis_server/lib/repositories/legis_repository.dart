import 'package:legis_server/legis_server.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:legis_core/legis_core.dart';

class LegisRepository {
  Future<List<Map<String, dynamic>>> getAllAsMap(Filtros filtros) {
    return db.collection('leis').find().toList();
  }

  Future<Map<String, dynamic>> getByIdAsMap(dynamic id) async {
    return db.collection('leis').find({'id': id}).first;
  }

  Future<void> createFromMap(Map<String, dynamic> data) async {
    await db.collection('leis').insert(data);
  }

  Future<void> updateFromMap(dynamic id, Map<String, dynamic> data) async {
    final Map<String, dynamic> lei = await db.collection('leis').findOne({'id': id});
    lei.clear();
    await db.collection('leis').save(data);
    /* lei['elementos'].forEach((key, value) {
      if (data.containsKey(key)) {
        //v1[key] = data[key];
        db.collection('leis').update(where.eq('id', id), modify.set(key, data[key]));

      }
    });*/
  }
}
