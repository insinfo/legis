import 'package:legis/src/shared/models/lei.dart';

import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

class RepositoryBase {
  Database _db;
  StoreRef<int, Map<String, dynamic>> store;
  int _indexIncrement = 0;
  RepositoryBase() {
    initDB();
  }

  Future<void> initDB() async {
    // Declare our store (records are mapd, ids are ints)
    store = intMapStoreFactory.store();
    var factory = databaseFactoryWeb;
    // Open the database
    _db = await factory.openDatabase('legis');
  }

  Future<Lei> add(Lei lei) async {
    _indexIncrement++;
    lei.id = _indexIncrement;
    var key = await store.add(_db, lei.toMap());
    print('key $key');
    print('_indexIncrement $_indexIncrement');
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

  Future<Lei> getById(int id) async {
    var map = await store.record(id).get(_db);
    return Lei.fromMap(map);
  }

  Future<void> deleteById(int id) async {
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
