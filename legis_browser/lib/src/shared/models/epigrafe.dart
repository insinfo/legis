import 'package:intl/intl.dart';
import 'package:legis/src/shared/models/lei_element.dart';

///A epígrafe é a parte do ato que o qualifica na ordem jurídica e o situa no tempo, por meio da data, da numeração e da denominação.
///Exemplo de epígrafe: LEI No 8.078, DE 11 DE SETEMBRO DE 1990.
class Epigrafe extends LegisElement {
  DateTime dataVigorar;

  @override
  String tagName = 'Epigrafe';

  Epigrafe({
    String label,
    String conteudo,
    int numero,
    String tagName,
    this.dataVigorar,
  }) : super(
          label: label,
          conteudo: conteudo,
          numero: numero,
          tagName: tagName,
        );

  Epigrafe.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    dataVigorar = DateTime.tryParse(map['dataVigorar']);
  }

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

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();

    map['dataVigorar'] = dataVigorar.toString();
    return map;
  }
}
