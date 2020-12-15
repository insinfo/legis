import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:legis/src/shared/models/alinea.dart';
import 'package:legis/src/shared/models/artigo.dart';
import 'package:legis/src/shared/models/lei_element.dart';
import 'package:legis/src/shared/models/paragrafo.dart';
import 'package:legis/src/shared/repositories/repository_base.dart';

@Component(
    selector: 'editable-item',
    styleUrls: [
      'editable_item.css',
    ],
    templateUrl: 'editable_item.html',
    directives: [
      coreDirectives,
      materialDirectives,
      formDirectives,
      routerDirectives,
    ],
    exports: [Alinea, Artigo, Paragrafo])
class EditableItemComponent {
  final RepositoryBase repositoryBase;

  @Input('element')
  LegisElement element;

  EditableItemComponent(this.repositoryBase);

  bool get isArtigo {
    return element is Artigo;
  }
}
