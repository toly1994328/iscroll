import 'package:flutter/material.dart';
class CustomToggleButtons extends StatefulWidget {
  @override
  _CustomToggleButtonsState createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  var _isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: <Widget>[
        Icon(Icons.skip_previous),
        Icon(Icons.pause),
        Icon(Icons.skip_next),
      ],
      borderWidth: 1,
      borderRadius: BorderRadius.circular(10),
      isSelected: _isSelected,
      onPressed: (value) => setState(() {
        _isSelected = _isSelected.map((e) => false).toList();
        _isSelected[value] = true;
      }),
    );

  }
}