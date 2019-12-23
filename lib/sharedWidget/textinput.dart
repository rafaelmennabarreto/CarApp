import 'package:carapp/pallet.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  Input(
      {this.placeholder,
      this.onchange,
      this.label = '',
      this.readOnly = false,
      this.onTap,
      this.icon});

  final String placeholder;
  final String label;
  final Function(String text) onchange;
  final bool readOnly;
  final Function onTap;
  final IconData icon;

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
                readOnly: widget.readOnly,
                onTap: () => widget.onTap(),
                decoration: InputDecoration(
                    hintText: widget.placeholder,
                    focusedBorder: borderActive,
                    icon: widget.icon != null ? Icon(widget.icon) : null))
          ],
        ));
  }
}
