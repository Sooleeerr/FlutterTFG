import 'package:flutter/material.dart';

/* VARIABLES API
  var marcaArticulo = req.query.marcaArticulo;
  var modeloArticulo = req.query.modeloArticulo;
  var almacenamientoArticulo = req.query.almacenamientoArticulo;
  var colorArticulo = req.query.colorArticulo;
  var precioMinimo = parseFloat(req.query.precioMinimo);
  var precioMaximo = parseFloat(req.query.precioMaximo);*/
//Icons.tune (filtrado)
//Icons.swapVert (ordenación)
class Filtrado extends StatefulWidget {
  const Filtrado({Key? key}) : super(key: key);

  @override
  State<Filtrado> createState() => _FiltradoState();
}

class _FiltradoState extends State<Filtrado> {
  String selectedValueMarca = '';
  String selectedValueCapacidad = '';
  String dropdownMarcaValue = 'Seleccione Marca';
  var itemsMarca = [
    'Seleccione Marca',
    'Apple',
    'Samsung',
    'Xiaomi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: Container(
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
                DropdownButton(
                  // Initial Value
                  value: dropdownMarcaValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: itemsMarca.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownMarcaValue = newValue!;
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
