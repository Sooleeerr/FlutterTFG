import 'package:flutter/material.dart';
import 'package:tfg/widgets/pedido.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tus datos",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: "Correo"),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: "Contraseña"),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Acción a realizar cuando se presiona el botón
                print('Botón presionado');
              },
              child: Text('Modificar'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Acción a realizar cuando se presiona el botón
                print('Botón presionado');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Cerrar sesión'),
            ),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tus pedidos",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Flexible(
              //flex: 9,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: GridView.count(
                  crossAxisCount: 1,
                  padding: EdgeInsets.all(20),
                  mainAxisSpacing: 10,
                  childAspectRatio: 20,
                  children: <Widget>[
                    Pedido(),
                    Pedido(),
                    Pedido(),
                    Pedido(),
                    Pedido(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ); //TOCAR A PARTIR DE AQUI
  }
}
