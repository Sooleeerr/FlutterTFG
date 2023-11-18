import 'package:flutter/material.dart';
import 'package:tfg/widgets/articuloDetallePedido.dart';

class detallePedido extends StatelessWidget {
  const detallePedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("34"),
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
          child: Container(
        padding: EdgeInsets.all(40),
        child: Column(children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  "TOTAL: precio_total",
                ),
              ),
            ),
          ),
          Flexible(
            flex: 9,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: GridView.count(
                crossAxisCount: 1,
                padding: EdgeInsets.all(20),
                mainAxisSpacing: 20,
                childAspectRatio: 3.5,
                children: <Widget>[
                  ArticuloDetallePedido(),
                  ArticuloDetallePedido(),
                  ArticuloDetallePedido(),
                  ArticuloDetallePedido(),
                  ArticuloDetallePedido(),
                  ArticuloDetallePedido(),
                  ArticuloDetallePedido(),
                  ArticuloDetallePedido(),
                ],
              ),
            ),
          )
        ]),
      )), //TOCAR A PARTIR DE AQUI
    );
  }
}
