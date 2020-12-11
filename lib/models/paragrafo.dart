import 'package:legis/models/lei_element.dart';
//PARÁGRAFO: É o desdobramento de um artigo, pode ser uma condição, exceção ou esclarecimento.
//O símbolo do parágrafo - §

class Paragrafo extends LeiElement {
  //§ 1º || Parágrafo Único -
  Paragrafo({
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

  Paragrafo.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
