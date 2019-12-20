import 'package:carapp/home/cart.dart';
import 'package:carapp/pallet.dart';
import 'package:carapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var assetImage = new AssetImage('assets/HomeBackground.jpg');

  image() => new DecorationImage(image: assetImage, fit: BoxFit.cover);
  BoxDecoration containerStyle() => BoxDecoration(image: image());

  goManutencao() => Routes.goManutencao(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Pallet.appBarColor,
          title: Center(child: Text('home')),
        ),
        body: Container(
          decoration: containerStyle(),
          child: Center(
            child: Wrap(
              spacing: 15,
              children: <Widget>[
                CartComponent(
                    FontAwesomeIcons.tools, 'Manutencao', goManutencao),
                CartComponent(FontAwesomeIcons.gasPump, 'Abastecimento')
              ],
            ),
          ),
        ));
  }
}
