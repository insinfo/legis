import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
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
class HomePage implements OnInit {
  final RepositoryBase repositoryBase;

  HomePage(this.repositoryBase);

  @override
  Future<Null> ngOnInit() async {}
}
