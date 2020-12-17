import 'package:legis_core/models/legis_element.dart';

class Link extends LegisElement {
  @override
  String tagName = 'Link';

  ///lei que criou o link -- id lei origin
  String from;

  ///lei destino -- id lei destino
  String to;

  /// supresão, adição, modificação -- isso vai indicar o tipo de modificação que vai ocorrer na lei destino
  String tipoLink;

  Link({
    String label,
    String conteudo,
    int numero,
    String tagName,
    this.from,
    this.to,
    this.tipoLink,
  }) : super(
          label: label,
          conteudo: conteudo,
          numero: numero,
          tagName: tagName,
        );

  Link.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    from = map['from'];
    to = map['to'];
    tipoLink = map['tipoLink'];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map['from'] = from;
    map['to'] = to;
    map['tipoLink'] = tipoLink;
    return map;
  }
}
