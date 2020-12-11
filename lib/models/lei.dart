import 'package:legis/models/capitulo.dart';
import 'package:legis/models/lei_element.dart';
import 'package:legis/models/titulo.dart';

class Lei {
  List<LeiElement> elementos;

  int numero;
  DateTime dataPublicacao;
  DateTime dataVigurar;
  String ementa; //ementa é a parte do ato que sintetiza o conteúdo da lei
  //Exemplo de ementa: Dispõe sobre a proteção do consumidor e dá outras providências
  String epigrafe; //LEI No 8.078, DE 11 DE SETEMBRO DE 1990.
  String preambulo;
  //Preâmbulo
  /*Exemplo de autoria:
  O Presidente da República
  Faço saber que o Congresso Nacional decreta e eu sanciono a seguinte lei (...)
  Exemplo de ordem de execução:
  O Congresso Nacional decreta e eu sanciono a seguinte lei: 
  
  Matéria Legislada: Texto ou Corpo da Lei
  artigo -> parágrafos -> incisos -> alíneas
  
  Art. 206. Prescreve: // artigo
  § 1o Em um ano: // O símbolo do parágrafo - §
  I - a pretensão dos hospedeiros ou fornecedores ...; //inciso
  II - a pretensão do segurado contra o segurador, ...: //inciso
  a) para o segurado, no caso de seguro de responsabilidade ...;
  b) quanto aos demais seguros, da ciência do fato gerador da pretensão; (...)"
  ARTIGOS: É o fundamento principal da lei. Toda LEI possui no mínimo um artigo.
  CAPUT: É o enunciado do artigo
  PARÁGRAFO: É o desdobramento de um artigo, pode ser uma condição, exceção ou esclarecimento.
  INCISO: Inciso é representado por números romanos.
  ALÍNEA: As alíneas são representadas letras minúsculas, um artigo pode conter alíneas, sem depender de incisos ou parágrafos.
  */
}
