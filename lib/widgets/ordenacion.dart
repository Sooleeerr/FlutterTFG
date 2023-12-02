// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:tfg/constants.dart';
import 'package:tfg/models/filtro_model.dart';

class Ordenacion extends StatefulWidget {
  final Function(FiltroModel) callback;
  final FiltroModel filtroModel;

  Ordenacion({Key? key, required this.callback, required this.filtroModel})
      : super(key: key);

  @override
  State<Ordenacion> createState() => _OrdenacionState();
}

class _OrdenacionState extends State<Ordenacion> {
  late int selectedOption;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedOption = widget.filtroModel.ordenacion;
  }

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
      body: Column(
        children: [
          const Text(
            "A continuación puedes ordenar por precio",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Sin ordenar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Radio(
                  value: 0,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value as int;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text(
                  'De menor precio a mayor',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value as int;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text(
                  'De mayor precio a menor',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Radio(
                  value: -1,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value as int;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                widget.filtroModel.ordenacion = selectedOption;
                widget.callback(widget.filtroModel);
                Navigator.pop(context);
              },
              child: Text(
                'Ordenar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kSecondaryColor,
              ),
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
