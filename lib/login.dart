import 'package:flutter/material.dart';
import 'package:rxdart_app/bloc/obscure_text.dart';
import 'package:rxdart_app/utils/accent_color_override.dart';
import 'package:rxdart_app/utils/colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  ObscureTextBloc _bloc = ObscureTextBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/home.jpg',
                ),
                SizedBox(height: 16.0),
              ],
            ),
            SizedBox(height: 16.0),
            AccentColorOverride(
              color: brown900,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: 'Username *',
                    hintText: 'Enter with your username.'),
              ),
            ),
            SizedBox(height: 8.0),
            AccentColorOverride(
              color: brown900,
              child: StreamBuilder<bool>(
                  stream: _bloc.obscureTextValueStream,
                  initialData: _bloc.obscureText,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _passwordController,
                      obscureText: snapshot.data,
                      maxLength: 8,
                      decoration: InputDecoration(
                        labelText: 'Password *',
                        hintText: 'Enter with your password.',
                        helperText: 'No more than 8 characters.',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _bloc.changeObscureText();
                          },
                          child: Icon(snapshot.data
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.only(top: 16.0),
              child: ButtonBar(
                children: <Widget>[
                  OutlineButton(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: brown400),
                    ),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                  ),
                  RaisedButton(
                    child: Text('Sign in'),
                    elevation: 8.0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text('Don\'t have an account?'),
                ),
                FlatButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: brown400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
