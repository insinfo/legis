import 'package:legis/src/shared/models/lei_element.dart';

///Câmara Municipal do Rio de Janeiro, 29 de outubro de 2020.
///Vereador JORGE FELIPPE
///Presidente
class Assinatura extends LegisElement {
  @override
  String tagName = 'Assinatura';

  Assinatura({
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

  Assinatura.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
