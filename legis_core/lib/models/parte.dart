import 'package:legis_core/models/legis_element.dart';

//Se a estrutura alentada do texto requerer desdobramentos, adotam-se as PARTES, que se denominam Parte Geral e Parte Especial.
class Parte extends LegisElement {
  @override
  String tagName = 'Parte';

  Parte({
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

  Parte.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
