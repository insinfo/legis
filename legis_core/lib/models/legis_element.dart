///Esta é a classe base para todos os elementos
class LegisElement {
  String id;
  List<LegisElement> elementos;
  String label;
  int numero;
  String conteudo;
  String tagName;
  bool isUpdated = false;

  LegisElement({
    this.label,
    this.conteudo,
    this.numero,
    this.tagName,
  });

  LegisElement.fromMap(Map<String, dynamic> map) {
    fillFromMap(map);
  }

  LegisElement fromMap(Map<String, dynamic> map) {
    var lei = LegisElement();
    lei.fillFromMap(map);
    return lei;
  }

  void fillFromMap(Map<String, dynamic> map) {
    id = map['id'];
    label = map['label'];
    conteudo = map['conteudo'];
    numero = map['numero'];
    tagName = map['tagName'];
    if (map.containsKey('elementos')) {
      elementos = map['elementos'].map((a) => LegisElement.fromMap(a)).toList();
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['label'] = label;
    map['conteudo'] = conteudo;
    map['numero'] = numero;
    map['tagName'] = tagName;

    if (elementos != null) {
      map['elementos'] = elementos.map((e) => e.toMap()).toList();
    }
    return map;
  }
}
