import 'package:legis/models/lei_element.dart';

///INCISO: Inciso é representado por números romanos.
///Ex:  I, XI, também é considerado um desdobramento, mas encontra-se em um nível inferior ao parágrafo.
class Inciso extends LeiElement {
//I,II,III,IV,XI
  Inciso({
    String label,
    String conteudo,
    int numero,
    String tagName,
  }) : super(
          label: label,
          conteudo: conteudo,
          numero: numero,
          tagName: tagName,
        );

  Inciso.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
