import 'package:legis_core/models/legis_element.dart';

///Ementa ou Rubrica da Lei é a parte do ato que sintetiza o conteúdo da lei
///Exemplo de ementa: Dispõe sobre a proteção do consumidor e dá outras providências
class Ementa extends LegisElement {
  @override
  String tagName = 'Ementa';

  Ementa({
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

  Ementa.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
