import 'package:carapp/pallet.dart';
import 'package:carapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'floatButton.dart';

class Manutencao extends StatefulWidget {
  @override
  _ManutencaoState createState() => _ManutencaoState();
}

class _ManutencaoState extends State<Manutencao> {
  bool displayOptions;
  Color buttonColor;

  @override
  void initState() {
    super.initState();

    displayOptions = false;
    buttonColor = Pallet.floatButtonDefaultColor;
  }

  void toogleOptions() {
    if (displayOptions) {
      setState(() {
        displayOptions = false;
        buttonColor = Pallet.floatButtonDefaultColor;
      });

      return;
    }

    setState(() {
      displayOptions = true;
      buttonColor = Pallet.errorColor;
    });
  }

  void goCadastrarManutencao() {
    Routes.goCadastrarManutencao(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Pallet.appBarColor,
          title: Text("Manutenção"),
        ),
        floatingActionButton: floatButtons());
  }

  Widget floatButtons() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatButton(
            key: Key('action1'),
            ico: FontAwesomeIcons.screwdriver,
            visible: displayOptions,
            onPress: () => goCadastrarManutencao(),
          ),
          FloatButton(
              key: Key('menu'),
              ico: FontAwesomeIcons.plus,
              visible: true,
              color: buttonColor,
              rotateAngle: 0.5,
              onPress: () => toogleOptions())
        ],
      );
}
