import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:legis_core/legis_core.dart';

class LegisController extends Controller implements Recyclable {
  LegisController() {
    dbConnect();
  }
  final Db db = Db("mongodb://localhost:27017/legis");
  DbCollection legisCollection;

  void dbConnect() async {
    await db.open();
    legisCollection = db.collection('leis');

    var lei = Lei(elementos: [
      Epigrafe(dataVigorar: DateTime.parse('2020-10-29'), numero: 6796),
      Ementa(conteudo: 'Regulamenta a comercialização de carne moída e frios fatiados e dá outras providências.'),
      Preambulo(
        conteudo:
            '''O Presidente da Câmara Municipal do Rio de Janeiro nos termos do art. 56, IV combinado com o art. 79, § 3º, da Lei Orgânica do Município do Rio de Janeiro, de 5 de abril de 1990, não exercida a disposição do § 7º do art. 79, promulga a Lei nº 6.796, de 29 de outubro de 2020, oriunda do Projeto de Lei nº 1679, de 2020, de autoria da Senhora Vereadora Vera Lins.
            ''',
      ),
      Artigo(
        label: 'Art. 1º',
        conteudo: '''
              Ficam, no âmbito do Município do Rio de Janeiro, os açougues, mercados, supermercados e/ou estabelecimentos similares, que comercializem carnes moídas e frios de qualquer espécie, proibidos de praticarem preço diferenciado do valor estipulado para a venda direta da peça ou pedaço do mesmo produto ou marca.
            ''',
      ),
      Artigo(
        label: 'Art. 2º',
        conteudo: '''
              Fica vedada qualquer espécie de cobrança ou acréscimo de preço no produto no ato de sua moedura ou fatiamento.
            ''',
      ),
      Assinatura(
        label: '',
        conteudo: '''
            Câmara Municipal do Rio de Janeiro, 29 de outubro de 2020.
Vereador JORGE FELIPPE
Presidente
            ''',
      )
    ]);
  }

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    if (request.method.contains('GET') && !request.path.variables.containsKey('id')) {
      return Response.ok(await getAll());
    } else if (request.method.contains('GET') && request.path.variables.containsKey('id')) {
      final id = int.parse(request.path.variables['id']);
      final data = await getById(id);
      if (data != null) {
        return Response.ok(data);
      } else {
        return Response.notFound();
      }
    } else if (request.method.contains('POST')) {
      final Map<String, dynamic> body = await request.body.decode();
      return Response.ok(await create(body));
    } else if (request.method.contains('PUT') && request.path.variables.containsKey('id')) {
      final Map<String, dynamic> body = await request.body.decode();
      return Response.ok(updateById(int.parse(request.path.variables['id']), body));
    }

    return Response.notFound();
  }

  Future<Map<String, dynamic>> getById(int id) {
    return legisCollection.find({'id': id}).first;
  }

  Future<Map<String, dynamic>> create(Map<String, dynamic> data) {
    return legisCollection.insert(data);
  }

  Future<Map<String, dynamic>> updateById(int id, Map<String, dynamic> data) async {
    final Map<String, dynamic> lei = await legisCollection.findOne({'id': id});
    // v1.clear();

    /*lei['elementos'].forEach((key, value) {
      if (data.containsKey(key)) {
        //v1[key] = data[key];
        legisCollection.update(where.eq('id', id), modify.set(key, data[key]));

      }
    });*/
    //await legisCollection.save(v1);
  }

  Future<List<Map<String, dynamic>>> getAll() {
    return legisCollection.find().toList();
  }

  @override
  get recycledState => true;

  @override
  void restore(state) {
    print(state);
  }
}
