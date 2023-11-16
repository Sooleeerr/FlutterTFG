import 'package:flutter/material.dart';
import 'package:tfg/widgets/articuloDetallePedido.dart';
import 'package:tfg/widgets/articuloCarrito.dart';

class Carrito extends StatelessWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Carrito de la compra"),
          ),
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
        body: SafeArea(
            child: Flexible(
          flex: 9,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: GridView.count(
              crossAxisCount: 1,
              padding: EdgeInsets.all(20),
              mainAxisSpacing: 10,
              childAspectRatio: 2.5,
              children: <Widget>[
                articuloCarrito(),
                articuloCarrito(),
                articuloCarrito(),
                articuloCarrito(),
                articuloCarrito(),
                articuloCarrito(),
                articuloCarrito(),
                articuloCarrito(),
              ],
            ),
          ),
        )), //TOCAR A PARTIR DE AQUI
      ),
    );
  }
}
