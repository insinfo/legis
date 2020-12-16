// my_custom_component.dart
import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'my-custom-component',
  template: '<div class="input-wrapper">{{value}}</div>',
  providers: [
    ExistingProvider.forToken(ngValueAccessor, MyCustomComponent),
  ],
)
class MyCustomComponent implements ControlValueAccessor<String> {
  String value;
  // ...could define a setter that call `_changeController.add(value)`

  final _changeController = StreamController<String>();

  @Output()
  Stream<String> get onChange => _changeController.stream;

  @override
  void writeValue(String newVal) {
    value = newVal ?? '';
  }

  @override
  void registerOnChange(callback) {
    onChange.listen((value) => callback(value));
  }

  // optionally you can implement the rest interface methods
  @override
  void registerOnTouched(TouchFunction callback) {}

  @override
  void onDisabledChanged(bool state) {}
}
