import 'package:legis/src/shared/models/lei_element.dart';

///ARTIGOS: É o fundamento principal da lei. Toda LEI possui no mínimo um artigo.
///CAPUT: É o enunciado do artigo
/// Art. 206. Prescreve: // artigo
class Artigo extends LegisElement {
  // artigo -> parágrafos -> incisos -> alíneas
  //Art. 206 //Art. 1º
  //caput
  @override
  String tagName = 'Artigo';

  Artigo({
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

  Artigo.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
