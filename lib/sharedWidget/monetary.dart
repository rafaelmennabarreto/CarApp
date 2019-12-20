import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../pallet.dart';

class InputMonetary extends StatefulWidget {
  InputMonetary({
    this.onchange,
    this.label = '',
  });

  final String label;
  final Function(String text) onchange;

  @override
  InputMonetaryState createState() => InputMonetaryState();
}

class InputMonetaryState extends State<InputMonetary> {
  UnderlineInputBorder borderActive = UnderlineInputBorder(
      borderSide: BorderSide(color: Pallet.inputBorderColor));

  final maskMoney = MoneyMaskedTextController(
      decimalSeparator: ',',
      thousandSeparator: '.',
      leftSymbol: 'R\$ ',
      initialValue: 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(7, 10, 7, 0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(widget.label),
            ),
            TextFormField(
                onChanged: (String text) => widget.onchange(text),
                controller: maskMoney,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(focusedBorder: borderActive))
          ],
        ));
  }
}
