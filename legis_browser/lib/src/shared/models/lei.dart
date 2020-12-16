import 'package:legis/src/shared/models/alinea.dart';
import 'package:legis/src/shared/models/artigo.dart';
import 'package:legis/src/shared/models/capitulo.dart';
import 'package:legis/src/shared/models/ementa.dart';
import 'package:legis/src/shared/models/epigrafe.dart';
import 'package:legis/src/shared/models/inciso.dart';
import 'package:legis/src/shared/models/lei_element.dart';
import 'package:legis/src/shared/models/paragrafo.dart';
import 'package:legis/src/shared/models/preambulo.dart';
import 'package:legis/src/shared/models/titulo.dart';

class Lei {
  int id;
  List<LegisElement> elementos;
  String tipo = 'Lei Ordinaria';
  String nome;

  String get descricao => '$tipo ${epigrafe?.numero}/${epigrafe?.ano}';

  Epigrafe get epigrafe {
    if (elementos != null) {
      var e = elementos.where((a) => a is Epigrafe);
      print(e.length);
    }
  }
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

  Lei({
    this.id,
    this.tipo,
    this.nome,
    this.elementos,
  });

  void addElement(LegisElement element) {
    elementos = elementos ?? <LegisElement>[];
    elementos.add(element);
  }

  int countArtigo() {
    if (elementos == null || elementos.isEmpty) {
      return 0;
    }
    return elementos.whereType<Artigo>().toList().length;
  }

  int countAlinea() {
    if (elementos == null || elementos.isEmpty) {
      return 0;
    }
    return elementos.whereType<Alinea>().toList().length;
  }

  int countCapitulo() {
    if (elementos == null || elementos.isEmpty) {
      return 0;
    }
    return elementos.whereType<Capitulo>().toList().length;
  }

  int countEmenta() {
    if (elementos == null || elementos.isEmpty) {
      return 0;
    }
    return elementos.whereType<Ementa>().toList().length;
  }

  int countInciso() {
    if (elementos == null || elementos.isEmpty) {
      return 0;
    }
    return elementos.whereType<Inciso>().toList().length;
  }

  int countParagrafo() {
    if (elementos == null || elementos.isEmpty) {
      return 0;
    }
    return elementos.whereType<Paragrafo>().toList().length;
  }

  int countPreambulo() {
    if (elementos == null || elementos.isEmpty) {
      return 0;
    }
    return elementos.whereType<Preambulo>().toList().length;
  }

  int countTitulo() {
    if (elementos == null || elementos.isEmpty) {
      return 0;
    }
    return elementos.whereType<Titulo>().toList().length;
  }

  int countEpigrafe() {
    if (elementos == null || elementos.isEmpty) {
      return 0;
    }
    return elementos.whereType<Epigrafe>().toList().length;
  }

  Lei.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    tipo = map['tipo'];
    nome = map['nome'];
    if (map.containsKey('elementos')) {
      elementos = elementos ?? <LegisElement>[];
      // var d = map['elementos'].map((a) => LegisElement.fromMap(a)).toList();
      map['elementos'].forEach((i) {
        elementos.add(LegisElement.fromMap(i));
      });
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['tipo'] = tipo;
    map['nome'] = nome;
    if (elementos != null) {
      map['elementos'] = elementos.map((e) => e.toMap()).toList();
    }
    return map;
  }
}
