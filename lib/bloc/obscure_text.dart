import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class ObscureTextBloc {
  // ignore: close_sinks
  BehaviorSubject<bool> behaviorSubject = BehaviorSubject<bool>();

  Observable<bool> get obscureTextValueStream => behaviorSubject.stream;

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  void changeObscureText() {
    this._obscureText = !this._obscureText;
    this.behaviorSubject.sink.add(this._obscureText);
  }

  void dispose() {
    this.behaviorSubject.close();
  }
}
