import 'package:flutter/material.dart';
import 'package:tfg/widgets/articulo.dart';

void main() {
  runApp(const Perfil());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mundo móvil"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Articulo(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.home),
              ),
              label: "Principal",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.discount),
              ),
              label: "Promociones",
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.shopping_cart),
              ),
              label: "Carrito",
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.person),
              ),
              label: "Perfil",
              backgroundColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Text(
              "Tus datos",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 60.0),
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
            SizedBox(height: 40.0),
            Text(
              "Tus pedidos",
              style: TextStyle(fontSize: 20),
            ),
            /*Pedidos usuario*/
            SizedBox(height: 80.0),
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
          ],
        )), //TOCAR A PARTIR DE AQUI
      ),
    );
  }
}
