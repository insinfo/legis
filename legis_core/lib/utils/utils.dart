import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';

/// utilitarios
class CoreUtils {
  /// formata uma data no padrão brasileiro
  static String toBrasilDate(DateTime date) {
    if (date == null) {
      return '';
    }
    var formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  /// codifica os dados para o formato json apropriado
  static String myJsonEncode(dynamic value) {
    return jsonEncode(value, toEncodable: (dynamic item) {
      if (item is DateTime) {
        //return item.toIso8601String();
        return item.toString();
      } else if (item is bool) {
        return item;
      } else if (item is String) {
        return item;
      } else if (item is num) {
        return item;
      }
      return item.toString();
    });
  }

  static String truncate(String value, int truncateAt) {
    if (value == null) {
      return value;
    }
    //int truncateAt = value.length-1;
    var elepsis = '...'; //define your variable truncation elipsis here
    var truncated = '';

    if (value.length > truncateAt) {
      truncated = value.substring(0, truncateAt - elepsis.length) + elepsis;
    } else {
      truncated = value;
    }
    return truncated;
  }

  static List<int> randomizer(int size) {
    var random = <int>[];
    for (var i = 0; i < size; i++) {
      random.add(Random().nextInt(9));
    }
    return random;
  }

  static String gerarCPF({bool formatted = false}) {
    var n = randomizer(9);
    n..add(gerarDigitoVerificador(n))..add(gerarDigitoVerificador(n));
    return formatted ? formatCPF(n) : n.join();
  }

  static int gerarDigitoVerificador(List<int> digits) {
    var baseNumber = 0;
    for (var i = 0; i < digits.length; i++) {
      baseNumber += digits[i] * ((digits.length + 1) - i);
    }
    var verificationDigit = baseNumber * 10 % 11;
    return verificationDigit >= 10 ? 0 : verificationDigit;
  }

  static bool validarCPF(String cpf) {
    if (cpf == null) {
      return false;
    } else if (cpf == '') {
      return false;
    } else if (cpf.length < 11) {
      return false;
    }

    var sanitizedCPF = cpf.replaceAll(RegExp(r'\.|-'), '').split('').map((String digit) => int.parse(digit)).toList();

    if (blacklistedCPF(sanitizedCPF.join())) {
      return false;
    }

    var result = sanitizedCPF[9] == gerarDigitoVerificador(sanitizedCPF.getRange(0, 9).toList()) &&
        sanitizedCPF[10] == gerarDigitoVerificador(sanitizedCPF.getRange(0, 10).toList());

    return result;
  }

  static bool blacklistedCPF(String cpf) {
    return cpf == '11111111111' ||
        cpf == '22222222222' ||
        cpf == '33333333333' ||
        cpf == '44444444444' ||
        cpf == '55555555555' ||
        cpf == '66666666666' ||
        cpf == '77777777777' ||
        cpf == '88888888888' ||
        cpf == '99999999999';
  }

  static String formatCPF(List<int> n) =>
      '${n[0]}${n[1]}${n[2]}.${n[3]}${n[4]}${n[5]}.${n[6]}${n[7]}${n[8]}-${n[9]}${n[10]}';

  static String sanitizeCPF(String val) {
    return val?.replaceAll(RegExp('[^0-9]'), '');
  }

  static bool isDate(String str) {
    try {
      //"dd/mm/yyyy"
      //DateFormat format = new DateFormat("dd/MM/yyyy");
      //var result = format.parse(str);
      //print(result);
      //DateTime.parse(str);
      var regexPattern =
          r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';

      var regExp = RegExp(
        regexPattern,
        caseSensitive: false,
        multiLine: false,
      );

      if (regExp.hasMatch(str)) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static bool isNotNullOrEmpty(value) {
    return value != null && value != 'null' && value != '';
  }

  static bool isNotNullOrEmptyAndContain(Map<String, dynamic> json, key) {
    return json.containsKey(key) && isNotNullOrEmpty(json[key]);
  }

  static double brazilianMoneyToDouble(input) {
    if (input == null) {
      return 0;
    }
    var i = input
        .toString()
        .substring(2)
        .replaceAll(',', '@')
        .replaceAll('.', '#')
        .replaceAll('@', '.')
        .replaceAll('#', ',')
        .replaceAll(',', '');
    return double.tryParse(i);
  }
}
