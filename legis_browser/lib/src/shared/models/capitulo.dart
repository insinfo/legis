import 'package:legis/src/shared/models/lei_element.dart';

class Capitulo extends LegisElement {
  @override
  String tagName = 'Capitulo';

  Capitulo({
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

  Capitulo.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
