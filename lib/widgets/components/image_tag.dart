import 'package:flutter/material.dart';

class ImageTag extends StatelessWidget {
  const ImageTag({
    Key? key,
    required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final String image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(image, scale: 3.5),
                    ),
                    /*Expanded(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    )*/
                  ],
                ),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              )
              //const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
