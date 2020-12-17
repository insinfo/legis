import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:legis/src/shared/repositories/browser_repository.dart';
import 'package:legis_core/legis_core.dart';

@Component(
  selector: 'editable-epigrafe',
  styleUrls: [
    'editable_epigrafe.css',
  ],
  templateUrl: 'editable_epigrafe.html',
  directives: [
    coreDirectives,
    formDirectives,
    routerDirectives,
  ],
)
class EditableEpigrafeComponent {
  final BrowserRepository repositoryBase;

  @Input('epigrafe')
  Epigrafe epigrafe;

  bool isEditando = false;
  EditableEpigrafeComponent(this.repositoryBase);

  void dblClickHandle() {
    isEditando = true;
  }

  void change() {
    isEditando = false;
  }
}
