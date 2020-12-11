class LeiElement {
  List<LeiElement> elementos;
  String label;
  int numero;
  String conteudo;
  String tagName;
  LeiElement({
    this.label,
    this.conteudo,
    this.numero,
    this.tagName,
  });

  LeiElement.fromMap(Map<String, dynamic> map) {
    label = map['label'];
    conteudo = map['conteudo'];
    numero = map['numero'];
    tagName = map['tagName'];
    if (map.containsKey('elementos')) {
      elementos = map['tagName'].map((a) => LeiElement.fromMap(a)).toList();
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
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
