import 'package:carapp/pallet.dart';
import 'package:carapp/sharedWidget/monetary.dart';
import 'package:carapp/sharedWidget/textinput.dart';
import 'package:flutter/material.dart';

class Cadastrarmanutencao extends StatefulWidget {
  @override
  _CadastrarmanutencaoState createState() => _CadastrarmanutencaoState();
}

class _CadastrarmanutencaoState extends State<Cadastrarmanutencao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Manutencao'),
        backgroundColor: Pallet.appBarColor,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Input(
              placeholder: "Ex .: Troca de oleo",
              label: 'Tipo de servico',
              onchange: (text) => print(text),
            ),
            Input(
              placeholder: "Ex .: pagar até dia 10",
              label: 'Observação',
              onchange: (text) => print(text),
            ),
            InputMonetary(
              label: 'Valor da manutenção',
              onchange: (text) => print(text),
            )
          ],
        ),
      ),
    );
  }
}
