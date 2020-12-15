import 'package:intl/intl.dart';
import 'package:legis/src/shared/models/lei_element.dart';

class Lei {
  int id;
  List<LegisElement> elementos;
  // DateTime dataPublicacao;
  DateTime dataVigorar;
  int numero;
  //int ano;

  ///Ementa ou Rubrica da Lei é a parte do ato que sintetiza o conteúdo da lei
  ///Exemplo de ementa: Dispõe sobre a proteção do consumidor e dá outras providências
  String ementa;

  ///A epígrafe é a parte do ato que o qualifica na ordem jurídica e o situa no tempo, por meio da data, da numeração e da denominação.
  ///Exemplo de epígrafe: LEI No 8.078, DE 11 DE SETEMBRO DE 1990.
  //String epigrafe;

  ///O preâmbulo contém a declaração do nome da autoridade, do cargo em que se acha investida e da atribuição constitucional em que se funda para promulgar a lei e a ordem de execução ou mandado de cumprimento, a qual prescreve a força coativa do ato normativo.
  ///Exemplo de autoria:
  ///O Presidente da República
  ///Faço saber que o Congresso Nacional decreta e eu sanciono a seguinte lei (...)
  ///Exemplo de ordem de execução:
  ///O Congresso Nacional decreta e eu sanciono a seguinte lei:
  String preambulo;
  String tipo;
  String nome;
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

  ///epigrafe: 'LEI Nº 6.796, DE 29 DE OUTUBRO DE 2020.',
  String get getEpigrafe {
    if (dataVigorar != null) {
      return 'LEI Nº $numero, DE ${dataVigorar.day} DE $getMesPorExtenso DE ${dataVigorar.year}';
    }
    return '';
  }

  String get getMesPorExtenso {
    if (dataVigorar != null) {
      return DateFormat.MMMM().format(dataVigorar).toUpperCase();
    }
    return '';
  }

  int get dia {
    return dataVigorar.day;
  }

  set dia(int d) {
    var string = dataVigorar.toString();
    string = string.replaceRange(8, 10, d.toString());
    dataVigorar = DateTime.parse(string);
  }

  String get mes {
    return dataVigorar.month.toString();
  }

  set mes(String m) {
    var string = dataVigorar.toString();
    string = string.replaceRange(5, 7, m);
    dataVigorar = DateTime.parse(string);
  }

  int get ano {
    return dataVigorar.year;
  }

  set ano(int a) {
    var string = dataVigorar.toString();
    string = string.replaceRange(0, 4, a.toString());
    dataVigorar = DateTime.parse(string);
  }

  Lei({
    this.id,
    // this.dataPublicacao,
    this.dataVigorar,
    this.ementa,
    // this.epigrafe,
    this.preambulo,
    this.numero,
    //this.ano,
    this.tipo,
    this.nome,
    this.elementos,
  });

  Lei.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    //dataPublicacao = DateTime.tryParse(map['dataPublicacao']);
    dataVigorar = DateTime.tryParse(map['dataVigorar']);
    ementa = map['ementa'];
    // epigrafe = map['epigrafe'];
    preambulo = map['preambulo'];

    numero = map['numero'];
    // ano = map['ano'];

    tipo = map['tipo'];
    nome = map['nome'];

    if (map.containsKey('elementos')) {
      elementos = map['elementos'].map((a) => LegisElement.fromMap(a)).toList();
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    // map['dataPublicacao'] = dataPublicacao.toString();
    map['dataVigorar'] = dataVigorar.toString();
    map['ementa'] = ementa;
    // map['epigrafe'] = epigrafe;
    map['preambulo'] = preambulo;

    map['numero'] = numero;
    //map['ano'] = ano;

    map['tipo'] = tipo;
    map['nome'] = nome;

    if (elementos != null) {
      map['elementos'] = elementos.map((e) => e.toMap()).toList();
    }
    return map;
  }
}
