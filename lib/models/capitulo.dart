class Capitulo {
  String label = '';
  String conteudo = '';
  Capitulo({this.label = '', this.conteudo = ''});

  factory Capitulo.fromMap(Map<String, dynamic> map) => Capitulo(
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
