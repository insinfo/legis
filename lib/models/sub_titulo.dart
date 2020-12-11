class SubTitulo {
  String label = '';
  String conteudo = '';
  SubTitulo({this.label = '', this.conteudo = ''});

  factory SubTitulo.fromMap(Map<String, dynamic> map) => SubTitulo(
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
