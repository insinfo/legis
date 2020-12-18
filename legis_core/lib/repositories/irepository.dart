import 'filtros.dart';

//typedef Expression = bool Function(Object);

abstract class IRepository<T> {
  Future<List<T>> getAll(Filtros filtros);
  Future<List<Map<String, dynamic>>> getAllAsMap(Filtros filtros);

  Future<T> getById(int id);
  Future<T> getBy(String field, String value);

  Future<T> create(T entity);
  Future<T> createFromMap(Map<String, dynamic> entityMap);

  Future<T> update(T entity);
  Future<T> updateFromMap(Map<String, dynamic> entityMap);

  Future<T> delete(T entity);
  Future<T> deleteFromMap(Map<String, dynamic> entityMap);

  Future<void> deleteAll(List<T> entities);
  Future<void> deleteAllFromMaps(List<Map<String, dynamic>> entityMaps);
}
