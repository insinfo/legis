import 'package:legis_core/models/legis_element.dart';

class SubTitulo extends LegisElement {
  @override
  String tagName = 'SubTitulo';

  SubTitulo({
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

  SubTitulo.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
