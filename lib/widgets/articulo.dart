import 'package:flutter/material.dart';

class Articulo extends StatelessWidget {
  const Articulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                  "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Iphone 12",
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text("300€"),
            )
          ],
        ),
      ),
    );
  }
}
