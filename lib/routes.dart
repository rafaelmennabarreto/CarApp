import 'package:carapp/home/home.dart';
import 'package:carapp/manutencao/cadastrarManutencao/cadastrarManutencao.dart';
import 'package:carapp/manutencao/manutencao.dart';
import 'package:flutter/material.dart';

class Routes {
  static goHome(context) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomeScreen()));

  static goManutencao(context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => Manutencao()));

  static goCadastrarManutencao(context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => Cadastrarmanutencao()));
}
