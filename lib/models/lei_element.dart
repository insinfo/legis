class LeiElement {
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
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['label'] = label;
    map['conteudo'] = conteudo;
    map['numero'] = numero;
    map['tagName'] = tagName;
    return map;
  }
}
