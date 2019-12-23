import 'package:carapp/pallet.dart';
import 'package:carapp/sharedWidget/datePicker.dart';
import 'package:carapp/sharedWidget/monetary.dart';
import 'package:carapp/sharedWidget/textinput.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cadastrarmanutencao extends StatefulWidget {
  @override
  _CadastrarmanutencaoState createState() => _CadastrarmanutencaoState();
}

class _CadastrarmanutencaoState extends State<Cadastrarmanutencao> {
  String _date = "";

  setDate(String date) => setState(() {
        _date = date;
      });

  selectDate() async {
    final selectedDate = await DatePicker.selectDate(context);
    if (selectedDate != null) {
      setDate(selectedDate.formatedDate('dd/MM/yyy'));
      return;
    }
    setDate('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Manutencao'),
        backgroundColor: Pallet.appBarColor,
      ),
      body: SingleChildScrollView(
        child: formulario(),
      ),
    );
  }

  formulario() => Container(
        height: MediaQuery.of(context).size.height * 0.86,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Input(
                  placeholder: "Ex .: Troca de oleo",
                  label: 'Tipo de servico',
                  icon: FontAwesomeIcons.cogs,
                  onchange: (text) => print(text),
                ),
                Input(
                  placeholder: "Ex .: pagar até dia 10",
                  label: 'Observação',
                  icon: FontAwesomeIcons.fileAlt,
                  onchange: (text) => print(text),
                ),
                Input(
                  placeholder:
                      _date.isEmpty ? "Clique para selecionar uma data" : _date,
                  label: 'Data do pagamento',
                  icon: FontAwesomeIcons.calendarAlt,
                  readOnly: true,
                  onTap: () => selectDate(),
                ),
                InputMonetary(
                  label: 'Valor da manutenção',
                  icon: FontAwesomeIcons.moneyBillWave,
                  onchange: (text) => print(text),
                ),
              ],
            ),
            ButtonTheme(
                child: Padding(
              padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
              child: MaterialButton(
                onPressed: () => {},
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: Text("Salvar"),
              ),
            )),
          ],
        ),
      );
}
