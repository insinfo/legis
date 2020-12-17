import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:legis_core/legis_core.dart';

import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

class BrowserRepository {
  Database _db;
  StoreRef<String, Map<String, dynamic>> store;

  BrowserRepository() {
    initDB();
  }

  Future<void> initDB() async {
    // Declare our store (records are mapd, ids are ints)
    store = stringMapStoreFactory.store();
    var factory = databaseFactoryWeb;
    // Open the database
    _db = await factory.openDatabase('legis');
  }

  Future<Lei> add(Lei lei) async {
    // _indexIncrement++;
    //  lei.id = _indexIncrement;
    var id1 = ObjectId();
    lei.id = id1.toHexString();
    await store.add(_db, lei.toMap());
    return lei;
  }

  Future<List<Lei>> getAll() async {
    if (store == null) {
      await initDB();
    }

    var lista = await store.query().getSnapshots(_db);
    /*lista.forEach((RecordSnapshot<int, Map<String, dynamic>> element) {
      print(element.value);
    });*/

    return lista.map((m) => Lei.fromMap(m.value)).toList();
  }

  Future<Lei> getById(String id) async {
    var map = await store.record(id).get(_db);
    return Lei.fromMap(map);
  }

  Future<void> deleteById(String id) async {
    await store.record(id).delete(_db);
  }

  Future<void> update(Lei element) async {
    await store.record(element.id).update(_db, element.toMap());
  }

  Future<void> closeDB() async {
    // Close the database
    await _db.close();
  }
}
