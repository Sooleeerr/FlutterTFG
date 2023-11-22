import 'package:flutter/material.dart';

/* VARIABLES API
  var marcaArticulo = req.query.marcaArticulo;
  var modeloArticulo = req.query.modeloArticulo;
  var almacenamientoArticulo = req.query.almacenamientoArticulo;
  var colorArticulo = req.query.colorArticulo;
  var precioMinimo = parseFloat(req.query.precioMinimo);
  var precioMaximo = parseFloat(req.query.precioMaximo);*/

class Filtrado extends StatefulWidget {
  const Filtrado({Key? key}) : super(key: key);

  @override
  State<Filtrado> createState() => _FiltradoState();
}

class _FiltradoState extends State<Filtrado> {
  String selectedValueMarca = '';
  String selectedValueCapacidad = '';

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
                "Filtrado de artículos2",
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
            Column(
              //children: [Text("iPhone"), Text("Samsung"), Text("Xiaomi")],
              children: [
                RadioListTile<String>(
                  title: Text('Apple'),
                  value: 'Apple',
                  groupValue: selectedValueMarca,
                  onChanged: (value) {
                    setState(() {
                      selectedValueMarca = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Samsung'),
                  value: 'Samsung',
                  groupValue: selectedValueMarca,
                  onChanged: (value) {
                    setState(() {
                      selectedValueMarca = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Xiaomi'),
                  value: 'Xiaomi',
                  groupValue: selectedValueMarca,
                  onChanged: (value) {
                    setState(() {
                      selectedValueMarca = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              "Modelo",
              style: TextStyle(fontSize: 16),
            ),
            Column(
              //Capacidad
              //children: [Text("iPhone"), Text("Samsung"), Text("Xiaomi")],
              children: [
                RadioListTile<String>(
                  title: Text('64 GB'),
                  value: '64GB',
                  groupValue: selectedValueCapacidad,
                  onChanged: (value) {
                    setState(() {
                      selectedValueCapacidad = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('128 GB'),
                  value: '128GB',
                  groupValue: selectedValueCapacidad,
                  onChanged: (value) {
                    setState(() {
                      selectedValueCapacidad = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('256 GB'),
                  value: '256GB',
                  groupValue: selectedValueCapacidad,
                  onChanged: (value) {
                    setState(() {
                      selectedValueCapacidad = value!;
                    });
                  },
                ),
              ],
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
