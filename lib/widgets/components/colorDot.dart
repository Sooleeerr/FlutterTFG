import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  ColorDot({
    Key? key,
    required this.color,
  }) : super(key: key);

  final String color;

  Map<String, Color> kColores = {
    "Negro": Colors.black,
    "Azul": Colors.blueAccent,
    "Plata": const Color.fromARGB(255, 220, 215, 215),
    "Rojo": Colors.red,
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: kColores[color],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
