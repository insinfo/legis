///ARTIGOS: É o fundamento principal da lei. Toda LEI possui no mínimo um artigo.
///CAPUT: É o enunciado do artigo
/// Art. 206. Prescreve: // artigo
class Artigo {
  String label = 'Art.'; //Art. 206 //Art. 1º
  int numero;
  String conteudo; //caput
  Artigo({this.label = '', this.conteudo});

  factory Artigo.fromMap(Map<String, dynamic> map) => Artigo(
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
