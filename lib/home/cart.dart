import 'package:flutter/material.dart';

class CartComponent extends StatefulWidget {
  CartComponent(this.ico, this.title, [this.onPress]);

  final IconData ico;
  final String title;
  final Function onPress;

  @override
  CartComponentState createState() => CartComponentState();
}

class CartComponentState extends State<CartComponent> {
  Color color = Colors.greenAccent;

  BoxDecoration containerStyle(double size) => BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(size),
          bottomRight: Radius.circular(size),
          topLeft: Radius.circular(size),
          topRight: Radius.circular(size)));

  void changeColor(Color colorToUpdate) {
    setState(() => color = colorToUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPress(),
      onTapDown: (TapDownDetails details) => changeColor(Colors.lightGreen),
      onTapUp: (TapUpDetails details) => changeColor(Colors.greenAccent),
      child: Container(
        decoration: containerStyle(7),
        width: 120,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.widget.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Icon(
              widget.ico,
              size: 56,
            )
          ],
        ),
      ),
    );
  }
}
