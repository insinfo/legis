import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:legis/src/modules/editor/components/editable_epigrafe/editable_epigrafe.dart';
import 'package:legis/src/shared/directives/contenteditable_directive.dart';
import 'package:legis/src/shared/models/alinea.dart';
import 'package:legis/src/shared/models/artigo.dart';
import 'package:legis/src/shared/models/ementa.dart';
import 'package:legis/src/shared/models/epigrafe.dart';
import 'package:legis/src/shared/models/lei.dart';
import 'package:legis/src/shared/models/lei_element.dart';
import 'package:legis/src/shared/models/paragrafo.dart';
import 'package:legis/src/shared/repositories/repository_base.dart';
import 'dart:html' as html;

@Component(
    selector: 'toolbar',
    styleUrls: [
      'toolbar.css',
    ],
    templateUrl: 'toolbar.html',
    directives: [
      coreDirectives,
      ContentEditableDirective,
      formDirectives,
      routerDirectives,
      EditableEpigrafeComponent,
    ],
    exports: [])
class ToolbarComponent implements OnDestroy, AfterViewInit {
  final RepositoryBase repositoryBase;

  StreamSubscription globalKeyPress;

  @Input('lei')
  Lei lei;

  ToolbarComponent(this.repositoryBase);

  void addArtigo() {
    var curentIdx = lei.countArtigo();
    curentIdx = curentIdx + 1;
    lei.addElement(Artigo(label: 'Art. ${curentIdx}º', conteudo: 'Click duplo para editar o Caput'));
  }

  void addEpigrafe() {
    var curentIdx = lei.countEpigrafe();
    if (curentIdx == 0) {
      lei.elementos.insert(0, Epigrafe(dataVigorar: DateTime.now(), numero: 1234));
    }
  }

  void addEmenta() {
    if (lei.countEmenta() == 0) {
      var idx = 0;
      if (lei.countEpigrafe() == 1) {
        idx = 1;
      }
      lei.elementos.insert(
        idx,
        Ementa(conteudo: 'Regulamenta a comercialização de carne moída e frios fatiados e dá outras providências.'),
      );
    }
  }

  @override
  void ngAfterViewInit() {
    globalKeyPress = html.document.body.onKeyDown.listen((e) {
      if (e.ctrlKey && e.key == 'a') {
        e.preventDefault();
        addArtigo();
      }
    });
  }

  @override
  void ngOnDestroy() {
    globalKeyPress.cancel();
  }
}
