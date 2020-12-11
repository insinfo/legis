import 'package:legis/models/lei_element.dart';

///ALÍNEA: As alíneas são representadas letras minúsculas,
///um artigo pode conter alíneas, sem depender de incisos ou parágrafos.
class Alinea extends LeiElement {
  // label; // a) b) c) ...
  Alinea({
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

  Alinea.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
