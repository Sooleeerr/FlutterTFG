import 'package:flutter/material.dart';
import 'package:tfg/widgets/pedido.dart';
//TODO Diseño
//TODO Copiar datos del usuario logado en los textfields
//TODO Integrar API Modificar
//TODO Integrar API Listado Pedidos
//TODO navegar a pantalla Detalle Pedidos con parámetros

class Administrador extends StatelessWidget {
  const Administrador({Key? key}) : super(key: key);

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
                "Administrador",
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: "Correo"),
              enabled: false,
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'Modificar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Acción a realizar cuando se presiona el botón
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Cerrar sesión',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tus pedidos",
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
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