import 'package:carapp/pallet.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  Input({this.placeholder, this.onchange, this.label = ''});

  final String placeholder;
  final String label;
  final Function(String text) onchange;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  UnderlineInputBorder borderActive = UnderlineInputBorder(
      borderSide: BorderSide(color: Pallet.inputBorderColor));

  final textStyle = TextStyle(color: Pallet.textLabel);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(7, 10, 7, 0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(widget.label, style: textStyle),
            ),
            TextFormField(
                onChanged: (String text) => widget.onchange(text),
                decoration: InputDecoration(
                    hintText: widget.placeholder, focusedBorder: borderActive))
          ],
        ));
  }
}
