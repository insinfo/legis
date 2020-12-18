import 'dart:convert';
import 'filtro.dart';

/*imit: 10
offset: 0
search: ab*/

class Filtros {
  List<Filtro> filtros;
  int limit = 10;
  int offset = 0;
  String orderBy;
  String orderDir = 'asc';
  int totalRecords = 0;
  String search;

  Filtros.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      limit = map.containsKey('limit') ? int.tryParse(map['limit'].toString()) : limit;
      offset = map.containsKey('offset') ? int.tryParse(map['offset'].toString()) : offset;
      orderBy = map.containsKey('orderBy') ? map['orderBy'] : orderBy;
      orderDir = map.containsKey('orderDir') ? map['orderDir'] : orderDir;
      search = map.containsKey('search') ? map['search'] : search;

      if (map.containsKey('filtros')) {
        var f = jsonDecode(Uri.decodeQueryComponent(map['filtros']));

        // print('Filtros@fromMap filtros ${map['filtros']}');
        // print('Filtros@fromMap f ${f}');
        filtros = (f as List).map((item) => Filtro.fromMap(item)).toList();
      } else {
        filtros = [];
      }
    }
  }

  Filtros({
    this.limit = 10,
    this.offset = 0,
    this.orderBy,
    this.orderDir = 'asc',
    this.totalRecords = 0,
    this.search,
    this.filtros,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['limit'] = limit;
    map['offset'] = offset;
    map['orderBy'] = orderBy;
    map['orderDir'] = orderDir;
    map['search'] = search;
    if (filtros?.isNotEmpty == true) {
      map['filtros'] = filtros.map((item) => item.toMap()).toList();
    }
    return map;
  }

  Map<String, String> toQueryParams() {
    final map = <String, String>{};
    if (limit != null) {
      map['limit'] = limit.toString();
    }
    if (offset != null) {
      map['offset'] = offset.toString();
    }
    if (orderBy != null) {
      map['orderBy'] = orderBy;
    }
    if (orderDir != null) {
      map['orderDir'] = orderDir;
    }
    if (search != null) {
      map['search'] = search;
    }

    if (filtros?.isNotEmpty == true) {
      var f = filtros.map((item) => item.toMap()).toList();
      map['filtros'] = Uri.encodeQueryComponent(jsonEncode(f));
    }
    return map;
  }

  void add(Filtro filter) {
    filtros ??= [];
    filtros.add(filter);
  }

  bool get isOrder {
    return orderBy != null;
  }

  bool get isLimit {
    return limit != null;
  }

  bool get isOffset {
    return offset != null;
  }

  bool get isSearchText {
    return search != null;
  }

  bool get isFiltros {
    if (filtros == null) {
      return false;
    }
    return filtros.isNotEmpty;
  }

  bool get isOrderAsc {
    return orderDir == 'asc';
  }
}
