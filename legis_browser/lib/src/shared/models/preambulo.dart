import 'package:legis/src/shared/models/lei_element.dart';

///O preâmbulo contém a declaração do nome da autoridade, do cargo em que se acha investida e da atribuição constitucional em que se funda para promulgar a lei e a ordem de execução ou mandado de cumprimento, a qual prescreve a força coativa do ato normativo.
///Exemplo de autoria:
///O Presidente da República
///Faço saber que o Congresso Nacional decreta e eu sanciono a seguinte lei (...)
///Exemplo de ordem de execução:
///O Congresso Nacional decreta e eu sanciono a seguinte lei:
class Preambulo extends LegisElement {
  @override
  String tagName = 'Preambulo';

  Preambulo({
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

  Preambulo.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
