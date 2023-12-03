import 'dart:ffi';

import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/filtro_model.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/components/TopRoundedContainer.dart';
import 'package:tfg/widgets/components/appBarAtras.dart';

class Filtrado extends StatefulWidget {
  final Function(FiltroModel) callback;
  final FiltroModel filtroModel;
  const Filtrado({Key? key, required this.callback, required this.filtroModel})
      : super(key: key);

  @override
  State<Filtrado> createState() => _FiltradoState();
}

class _FiltradoState extends State<Filtrado> {
  String dropdownMarcaValue = 'Seleccione Marca';
  var itemsMarca = [];

  var itemsModelo = [];
  var itemsAlmacenamiento = [];
  var itemsColor = [];
  var numeroArticulos = 0;

  final double _min = 0;
  final double _max = 1000;
  SfRangeValues _valuesPrecio = const SfRangeValues(0.0, 1000.0);

  List<String> selectedValueMarca = [];
  List<String> selectedValueModelo = [];
  List<String> selectedValueColor = [];
  List<String> selectedValueCapacidad = [];

  @override
  void initState() {
    super.initState();

    _getValoresFiltrado();
    selectedValueMarca = widget.filtroModel.valoresMarca;
    selectedValueModelo = widget.filtroModel.valoresModelo;
    selectedValueColor = widget.filtroModel.valoresColor;
    selectedValueCapacidad = widget.filtroModel.valoresAlmacenamiento;
    _valuesPrecio = SfRangeValues(
        widget.filtroModel.precioMin, widget.filtroModel.precioMax);
    _getNumeroArticulos();
  }

  void _getValoresFiltrado() async {
    itemsMarca = (await ApiService().getFiltradoOpciones("marca_articulo"))!;
    itemsAlmacenamiento =
        (await ApiService().getFiltradoOpciones("almacenamiento_articulo"))!;
    itemsModelo = (await ApiService().getFiltradoOpciones("modelo_articulo"))!;
    itemsColor = (await ApiService().getFiltradoOpciones("color_articulo"))!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getNumeroArticulos() async {
    numeroArticulos =
        (await ApiService().getContarListaArticulos(widget.filtroModel))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void setSelectedValuePrecio(SfRangeValues value) {
    setState(() {
      _valuesPrecio = value;
      widget.filtroModel.precioMin = _valuesPrecio.start;
      widget.filtroModel.precioMax = _valuesPrecio.end;
    });

    _getNumeroArticulos();
  }

  void setSelectedValueMarca(List<String> value) {
    setState(() {
      selectedValueMarca = value;
      widget.filtroModel.valoresMarca = selectedValueMarca;
    });

    _getNumeroArticulos();
  }

  void setSelectedValueModelo(List<String> value) {
    setState(() {
      selectedValueModelo = value;
      widget.filtroModel.valoresModelo = selectedValueModelo;
    });
    _getNumeroArticulos();
  }

  void setSelectedValueColor(List<String> value) {
    setState(() {
      selectedValueColor = value;
      widget.filtroModel.valoresColor = selectedValueColor;
    });
    _getNumeroArticulos();
  }

  void setSelectedValueCapacidad(List<String> value) {
    setState(() {
      selectedValueCapacidad = value;
      widget.filtroModel.valoresAlmacenamiento = selectedValueCapacidad;
    });
    _getNumeroArticulos();
  }

  @override
  Widget build(BuildContext context) {
    return (itemsMarca.isEmpty &&
            itemsAlmacenamiento.isEmpty &&
            itemsModelo.isEmpty &&
            itemsColor.isEmpty)
        ? Scaffold(
            backgroundColor: const Color(0xFFF5F6F9),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            extendBody: false,
            extendBodyBehindAppBar: false,
            backgroundColor: const Color(0xFFF5F6F9),
            appBar: const AppBarAtras(),
            body: Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Filtra por Marca",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InlineChoice<String>.multiple(
                      clearable: true,
                      value: selectedValueMarca,
                      onChanged: setSelectedValueMarca,
                      itemCount: itemsMarca.length,
                      itemBuilder: (state, i) {
                        return ChoiceChip(
                          selected: state.selected(itemsMarca[i]),
                          onSelected: state.onSelected(itemsMarca[i]),
                          selectedColor: kPrimaryColor,
                          label: Text(itemsMarca[i]),
                        );
                      },
                      listBuilder: ChoiceList.createWrapped(
                        spacing: 10,
                        runSpacing: 10,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                    const Text(
                      "Filtra por Modelo",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InlineChoice<String>.multiple(
                      clearable: true,
                      value: selectedValueModelo,
                      onChanged: setSelectedValueModelo,
                      itemCount: itemsModelo.length,
                      itemBuilder: (state, i) {
                        return ChoiceChip(
                          selected: state.selected(itemsModelo[i]),
                          onSelected: state.onSelected(itemsModelo[i]),
                          selectedColor: kPrimaryColor,
                          label: Text(itemsModelo[i]),
                        );
                      },
                      listBuilder: ChoiceList.createWrapped(
                        spacing: 10,
                        runSpacing: 10,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                    const Text(
                      "Filtra por precio",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SfRangeSliderTheme(
                      data: SfRangeSliderThemeData(
                        activeTrackColor: kPrimaryColor,
                        inactiveTrackColor: Colors.red[100],
                        thumbColor: kPrimaryColor,
                      ),
                      child: SfRangeSlider(
                        min: _min,
                        max: _max,
                        values: _valuesPrecio,
                        interval: 200,
                        enableTooltip: true,
                        tooltipShape: const SfPaddleTooltipShape(),
                        showLabels: true,
                        onChanged: (SfRangeValues value) {
                          setSelectedValuePrecio(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Filtra por capacidad",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InlineChoice<String>.multiple(
                      clearable: true,
                      value: selectedValueCapacidad,
                      onChanged: setSelectedValueCapacidad,
                      itemCount: itemsAlmacenamiento.length,
                      itemBuilder: (state, i) {
                        return ChoiceChip(
                          selected: state.selected(itemsAlmacenamiento[i]),
                          onSelected: state.onSelected(itemsAlmacenamiento[i]),
                          selectedColor: kPrimaryColor,
                          label: Text(itemsAlmacenamiento[i]),
                        );
                      },
                      listBuilder: ChoiceList.createWrapped(
                        spacing: 10,
                        runSpacing: 10,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                    const Text(
                      "Filtra por color",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InlineChoice<String>.multiple(
                      clearable: true,
                      value: selectedValueColor,
                      onChanged: setSelectedValueColor,
                      itemCount: itemsColor.length,
                      itemBuilder: (state, i) {
                        return ChoiceChip(
                          selected: state.selected(itemsColor[i]),
                          onSelected: state.onSelected(itemsColor[i]),
                          selectedColor: kPrimaryColor,
                          label: Text(itemsColor[i]),
                        );
                      },
                      listBuilder: ChoiceList.createWrapped(
                        spacing: 10,
                        runSpacing: 10,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: TopRoundedContainer(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: ElevatedButton(
                    onPressed: (numeroArticulos > 0)
                        ? () {
                            if (numeroArticulos != 0) {
                              widget.filtroModel.valoresAlmacenamiento =
                                  selectedValueCapacidad;
                              widget.filtroModel.valoresModelo =
                                  selectedValueModelo;
                              widget.filtroModel.valoresMarca =
                                  selectedValueMarca;
                              widget.filtroModel.valoresColor =
                                  selectedValueColor;
                              widget.callback(widget.filtroModel);
                              Navigator.pop(context);
                            }
                          }
                        : null,
                    child: Text(
                      "Ver productos ($numeroArticulos seleccionados)",
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
