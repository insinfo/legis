//PARÁGRAFO: É o desdobramento de um artigo, pode ser uma condição, exceção ou esclarecimento.
//O símbolo do parágrafo - §
class Paragrafo {
  String label = '§'; //§ 1º || Parágrafo Único -
  int numero;
  String conteudo;
  Paragrafo({this.label = '§', this.conteudo, this.numero});

  factory Paragrafo.fromMap(Map<String, dynamic> map) => Paragrafo(
        label: map['label'],
        conteudo: map['conteudo'],
        numero: map['numero'],
      );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['label'] = label;
    map['conteudo'] = conteudo;
    map['numero'] = numero;
    return map;
  }
}
