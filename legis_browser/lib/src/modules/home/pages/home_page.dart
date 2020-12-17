import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:legis/src/shared/repositories/browser_repository.dart';
import 'package:legis_core/legis_core.dart';

@Component(
  selector: 'home',
  styleUrls: [
    'home_page.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'home_page.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
)
class HomePage implements OnInit, AfterContentInit {
  final BrowserRepository repositoryBase;

  List<Lei> leis;

  HomePage(this.repositoryBase);

  @override
  Future<Null> ngOnInit() async {}

  @override
  void ngAfterContentInit() async {
    await Future.delayed(Duration(seconds: 2));
    leis = await repositoryBase.getAll();
  }
}
