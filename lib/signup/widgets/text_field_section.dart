import 'package:flutter/material.dart';
import 'package:rxdart_app/signup/blocs/text_field_bloc.dart';
import 'package:rxdart_app/utils/accent_color_override.dart';
import 'package:rxdart_app/utils/colors.dart';

class TextFieldSection extends StatefulWidget {
  final TextFieldBloc _textFieldBloc = TextFieldBloc();

  @override
  _TextFieldSectionState createState() => _TextFieldSectionState();

  void validateField() {
    _textFieldBloc.validateField();
  }
}

class _TextFieldSectionState extends State<TextFieldSection> {

  @override
  void dispose() {
    widget._textFieldBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _textFieldSection();
  }

  Widget _buildTextField(
      String label, String hint, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: AccentColorOverride(
        color: brown900,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: label, hintText: hint),
        ),
      ),
    );
  }

  Widget _textFieldSection() {
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildTextField(
              'Username *', 'Enter with your username.', widget._textFieldBloc.usernameController),
          _buildTextField(
              'Password *', 'Enter with your password.', widget._textFieldBloc.passwordController),
          _buildTextField('Email Address *', 'Enter with your email address.',
              widget._textFieldBloc.emailController),
          _buildTextField('Phone Number *', 'Enter with your phone number.',
              widget._textFieldBloc.phoneController),
        ],
      ),
    );
  }


}
