class Titulo {
  String label = '';
  String conteudo = '';
  Titulo({this.label = '', this.conteudo = ''});

  factory Titulo.fromMap(Map<String, dynamic> map) => Titulo(
        label: map['label'],
        conteudo: map['conteudo'],
      );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['label'] = label;
    map['conteudo'] = conteudo;
    return map;
  }
}
