class Filtro {
  String field;
  String operator;
  String value;

  Filtro({this.field, this.operator, this.value});

  Filtro.fromMap(Map<String, dynamic> map) {
    field = map['field'];
    operator = map['operator'];
    value = map['value'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['field'] = field;
    map['operator'] = operator;
    map['value'] = value;
    return map;
  }

  Map<String, String> toQueryParams() {
    final map = <String, String>{};
    map['field'] = field;
    map['operator'] = operator;
    map['value'] = value;
    return map;
  }
}
