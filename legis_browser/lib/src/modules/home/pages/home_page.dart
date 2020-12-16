import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:legis/src/shared/models/artigo.dart';
import 'package:legis/src/shared/models/assinatura.dart';
import 'package:legis/src/shared/models/ementa.dart';
import 'package:legis/src/shared/models/epigrafe.dart';
import 'package:legis/src/shared/models/lei.dart';
import 'package:legis/src/shared/models/preambulo.dart';
import 'package:legis/src/shared/repositories/repository_base.dart';

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
  final RepositoryBase repositoryBase;

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
