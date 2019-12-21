import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  int _currentIndex = 1;

  List<GroupModel> _group = [
    GroupModel(
      text: "Masculino",
      index: 1,
    ),
    GroupModel(
      text: "Feminino",
      index: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _group
          .map(
            (t) => _buildRadio(t.index, t.text),
          )
          .toList(),
    );
  }

  Widget _buildRadio(int index, String name) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Radio(
            value: index,
            groupValue: _currentIndex,
            onChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Text(
            name,
          ),
        ],
      ),
    );
  }
}

class GroupModel {
  String text;
  int index;

  GroupModel({this.text, this.index});
}
