import 'package:legis_core/models/legis_element.dart';

/*
A dimensão de determinados textos legais exige uma sistematização adequada. No direito brasileiro consagra-se a seguinte prática para a divisão das leis mais extensas:
 um conjunto de artigos compõe uma SEÇÃO;
 uma seção é composta por várias SUBSEÇÕES;
 um conjunto de seções constitui um CAPÍTULO;
 um conjunto de capítulos constitui um TÍTULO;
 um conjunto de títulos constitui um LIVRO.
Se a estrutura alentada do texto requerer desdobramentos, adotam-se as PARTES, que se denominam Parte Geral e Parte Especial.
Por exemplo, o Código Civil de 10 de janeiro de 2002:
PARTE GERAL
LIVRO I
DAS PESSOAS
TÍTULO I
DAS PESSOAS NATURAIS
CAPÍTULO I
DA PERSONALIDADE E DA CAPACIDADE
CAPÍTULO II
DOS DIREITOS DA PERSONALIDADE
CAPÍTULO III
DA AUSÊNCIA
Seção I
Da Curadoria dos Bens do Ausente
Seção II
Da Sucessão Provisória
Seção III
Da Sucessão Definitiva
 */
class Secao extends LegisElement {
  @override
  String tagName = 'Secao';

  Secao({
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

  Secao.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap();
  }
}
