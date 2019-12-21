import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class CheckBoxBloc {
  // ignore: close_sinks
  BehaviorSubject<bool> behaviorSubject = BehaviorSubject<bool>();

  Observable<bool> get checkBoxValueStream => behaviorSubject.stream;

  bool _checkBoxValue = false;

  bool get checkBoxValue => _checkBoxValue;

  void changeCheckBoxValue(bool value) {
    this._checkBoxValue = value;
    this.behaviorSubject.sink.add(this._checkBoxValue);
  }

  void dispose() {
    this.behaviorSubject.close();
  }
}