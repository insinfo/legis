import 'package:legis/src/shared/models/lei_element.dart';

class Titulo extends LegisElement {
  @override
  String tagName = 'Titulo';

  Titulo({
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

  Titulo.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
