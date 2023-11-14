import 'package:flutter/material.dart';

class Articulo extends StatelessWidget {
  const Articulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: Color.fromARGB(255, 172, 170, 170), width: 2)),
        child: Column(
          children: [
            const Flexible(
              flex: 8,
              child: Image(
                image: NetworkImage(
                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Iphone 12",
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text("200€"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
