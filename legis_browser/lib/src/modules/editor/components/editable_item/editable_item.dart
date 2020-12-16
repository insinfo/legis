import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:legis/src/modules/editor/components/editable_epigrafe/editable_epigrafe.dart';
import 'package:legis/src/shared/directives/contenteditable_directive.dart';
import 'package:legis/src/shared/models/alinea.dart';
import 'package:legis/src/shared/models/artigo.dart';
import 'package:legis/src/shared/models/ementa.dart';
import 'package:legis/src/shared/models/epigrafe.dart';
import 'package:legis/src/shared/models/lei_element.dart';
import 'package:legis/src/shared/models/paragrafo.dart';
import 'package:legis/src/shared/models/preambulo.dart';
import 'package:legis/src/shared/repositories/repository_base.dart';
import 'dart:html' as html;

@Component(
    selector: 'editable-item',
    styleUrls: [
      'editable_item.css',
    ],
    templateUrl: 'editable_item.html',
    directives: [
      coreDirectives,
      ContentEditableDirective,
      formDirectives,
      routerDirectives,
      EditableEpigrafeComponent,
    ],
    exports: [Alinea, Artigo, Paragrafo])
class EditableItemComponent {
  final RepositoryBase repositoryBase;

  @Input('element')
  LegisElement element;

  bool isEditando = false;
  bool isMouseEnter = false;
  bool isMouseLeave = false;
  html.HtmlElement lastMouseEnterElement;

  EditableItemComponent(this.repositoryBase);

  void ondblClickForEdit() {
    isEditando = true;
  }

  void onBlurExitEdit() {
    isEditando = false;
    /*Future.delayed(Duration(milliseconds: 500), () {
      isEditando = false;
    });*/
  }

  void onMouseEnterHandle(html.HtmlElement element) {
    element.classes.add('hover');
    // lastMouseEnterElement
    //print('onMouseEnterHandle');
  }

  void onMouseLeaveHandle(html.HtmlElement element) {
    element.classes.remove('hover');
    //print('onMouseLeaveHandle');
  }

  bool get isArtigo {
    return element is Artigo;
  }

  bool get isEpigrafe {
    return element is Epigrafe;
  }

  bool get isEmenta {
    return element is Ementa;
  }

  bool get isPreambulo {
    return element is Preambulo;
  }
}
