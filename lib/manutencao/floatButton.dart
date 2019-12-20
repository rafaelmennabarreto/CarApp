import 'package:flutter/material.dart';
import 'dart:math' as math;

class FloatButton extends StatefulWidget {
  FloatButton(
      {this.key,
      this.ico,
      this.visible,
      this.color = Colors.green,
      this.onPress,
      this.rotateAngle = 0,
      this.animDurationMs = 300})
      : super(key: key);

  final IconData ico;
  final bool visible;
  final Function onPress;
  final Color color;
  final double rotateAngle;
  final int animDurationMs;
  final Key key;

  @override
  _FloatButtonState createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;
  bool keypressed = false;

  @override
  void initState() {
    super.initState();

    animController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    animation = Tween<double>(begin: 0, end: (widget.rotateAngle * math.pi) / 2)
        .animate(animController);

    animation.addListener(() => setState(() {}));
  }

  setKeypressedValue(bool val) {
    setState(() {
      keypressed = val;
    });
  }

  onPress() {
    widget.onPress != null ? widget.onPress() : null;

    if (keypressed) {
      setKeypressedValue(false);
      animController.reverse();
      return;
    }

    setKeypressedValue(true);
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: widget.visible ? 1 : 0,
        duration: Duration(milliseconds: 100),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: FloatingActionButton(
                onPressed: () => onPress(),
                heroTag: widget.key,
                backgroundColor: widget.color,
                tooltip: "Toggle Opacity",
                child: Transform.rotate(
                  angle: animation.value,
                  child: Icon(widget.ico),
                ))));
  }
}
