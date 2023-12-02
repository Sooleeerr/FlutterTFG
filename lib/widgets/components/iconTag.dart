import 'package:flutter/material.dart';

class IconTag extends StatelessWidget {
  const IconTag({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            //padding: const EdgeInsets.all(),
            height: 46,
            width: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Icon(icon, size: 35),
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 8),
                  ),
                )
              ],
            ),
          ),
          //const SizedBox(height: 4),
        ],
      ),
    );
  }
}
