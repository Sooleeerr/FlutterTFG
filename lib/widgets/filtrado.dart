import 'dart:html';

import 'package:flutter/material.dart';

class Filtrado extends StatelessWidget {
  const Filtrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Filtrado de artículos",
                style: TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Marca",
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [Text("iPhone"), Text("Samsung"), Text("Xiaomi")],
            )
          ],
        ),
      ),
    );

    //TOCAR A PARTIR DE AQUI
    /*RadioListTile<String>(
              title: Text('Option 1'),
              value: 'Option 1',
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  
                  selectedValue = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Option 2'),
              value: 'Option 2',
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Option 3'),
              value: 'Option 3',
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),*/
  }
}
