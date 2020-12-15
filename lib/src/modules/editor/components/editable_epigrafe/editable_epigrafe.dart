import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:legis/src/shared/models/lei.dart';
import 'package:legis/src/shared/models/lei_element.dart';
import 'package:legis/src/shared/repositories/repository_base.dart';

@Component(
  selector: 'editable-epigrafe',
  styleUrls: [
    'editable_epigrafe.css',
  ],
  templateUrl: 'editable_epigrafe.html',
  directives: [
    coreDirectives,
    materialDirectives,
    formDirectives,
    routerDirectives,
  ],
)
class EditableEpigrafeComponent {
  final RepositoryBase repositoryBase;

  @Input('lei')
  Lei lei;

  bool isEditando = false;
  EditableEpigrafeComponent(this.repositoryBase);

  void dblClickHandle() {
    isEditando = true;
  }

  void change() {
    isEditando = false;
  }
}
