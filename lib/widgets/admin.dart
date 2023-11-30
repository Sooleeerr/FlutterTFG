import 'package:flutter/material.dart';

//TODO Diseño
//TODO Pantalla

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
          ],
        ),
      ),
    ); //TOCAR A PARTIR DE AQUI
  }
}
