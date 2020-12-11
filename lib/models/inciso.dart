///INCISO: Inciso é representado por números romanos.
///Ex:  I, XI, também é considerado um desdobramento, mas encontra-se em um nível inferior ao parágrafo.
class Inciso {
  String label; //I,II,III,IV,XI
  String conteudo;
  Inciso({this.label, this.conteudo});

  factory Inciso.fromMap(Map<String, dynamic> map) => Inciso(
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
