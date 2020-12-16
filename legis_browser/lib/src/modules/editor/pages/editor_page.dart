import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:legis/src/modules/editor/components/editable_item/editable_item.dart';
import 'package:legis/src/modules/editor/components/toolbar/toolbar.dart';
import 'package:legis/src/shared/models/artigo.dart';
import 'package:legis/src/shared/models/assinatura.dart';
import 'package:legis/src/shared/models/ementa.dart';
import 'package:legis/src/shared/models/epigrafe.dart';
import 'package:legis/src/shared/models/lei.dart';
import 'package:legis/src/shared/models/preambulo.dart';
import 'package:legis/src/shared/repositories/repository_base.dart';

@Component(
  selector: 'editor',
  styleUrls: [
    'editor_page.css',
  ],
  templateUrl: 'editor_page.html',
  directives: [
    coreDirectives,
    formDirectives,
    routerDirectives,
    EditableItemComponent,
    ToolbarComponent,
  ],
)
class EditorPage implements OnInit {
  final RepositoryBase repositoryBase;

  Lei lei;
  EditorPage(this.repositoryBase) {
    lei = Lei(elementos: [
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
  Future<Null> ngOnInit() async {}
}
