import 'package:flutter/material.dart';
import 'package:rxdart_app/signup/widgets/select_gender.dart';
import 'package:rxdart_app/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'blocs/checkbox_bloc.dart';
import 'widgets/text_field_section.dart';
import 'widgets/title_section.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _checkBoxBloc;
  var _titleSection;
  var _textFieldSection;
  var _selectGender;

  @override
  void initState() {
    super.initState();
    this._checkBoxBloc = CheckBoxBloc();
    this._titleSection = TitleSection();
    this._textFieldSection = TextFieldSection();
    this._selectGender = SelectGender();
  }

  @override
  void dispose() {
    this._checkBoxBloc.dispose();
    super.dispose();
  }

  Widget _checkBoxTerms() {
    return Row(
      children: <Widget>[
        StreamBuilder<bool>(
            stream: _checkBoxBloc.checkBoxValueStream,
            initialData: false,
            builder: (context, snapshot) {
              return Checkbox(
                  value: snapshot.data,
                  onChanged: (bool value) {
                    this._checkBoxBloc.changeCheckBoxValue(value);
                  });
            }),
        InkWell(
          child: Text(
            "I agree to the terms and conditions.",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          onTap: () {
            _launchURL();
          },
        ),
      ],
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _signUpSection() {
    return Container(
        padding: const EdgeInsets.only(top: 24.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 32.0, fontWeight: FontWeight.bold, color: brown900),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
//                  Navigator.pushNamed(context, '/login');
                },
                child: ClipOval(
                  child: Container(
                    color: brown900,
                    height: 70,
                    width: 70,
                    child: Icon(
                      Icons.navigate_next,
                      size: 64.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            size: 48.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          children: <Widget>[
            _titleSection,
            _textFieldSection,
            _selectGender,
            _checkBoxTerms(),
            _signUpSection(),
          ],
        ),
      ),
    );
  }
}
