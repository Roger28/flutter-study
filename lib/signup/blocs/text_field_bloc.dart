import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class TextFieldBloc {
  // ignore: close_sinks
  BehaviorSubject<TextEditingController> behaviorSubject =
      BehaviorSubject<TextEditingController>();

  Observable<TextEditingController> get checkBoxValueStream =>
      behaviorSubject.stream;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();

  get emailController => _emailController;

  get passwordController => _passwordController;

  get usernameController => _usernameController;

  get phoneController => _phoneController;

  void validateField() {}

  void dispose() {
    this.behaviorSubject.close();
  }
}
