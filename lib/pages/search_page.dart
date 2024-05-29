import 'package:TrackingASL/data/decunica.dart';
import 'package:TrackingASL/data/service/decunica_service.dart';
import 'package:TrackingASL/dto/filtro.dart';
import 'package:TrackingASL/widgets/card_decunica.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  Filtro filtro = Filtro();
  List<Decunica>? decunicas = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadDecunicas() async {
    setState(() => loading = true);
    final decunicaService = DecunicaService();
    decunicas = await decunicaService.getAll(_searchController.text, filtro);
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _searchBar(),
            const SizedBox(height: 10),
            filtro.seleccionado ? _filterSelected() : _filters(),
            const SizedBox(height: 10),
            const Divider(height: 2),
            const SizedBox(height: 10),
            loading
                ? const CircularProgressIndicator()
                : (decunicas != null && decunicas!.isEmpty)
                    ? _emtySearch()
                    : Expanded(
                        child: ListView(
                          children: decunicas!
                              .map((value) => CardDecunica(decunica: value))
                              .toList(),
                        ),
                      )
          ],
        ),
      ),
    );
  }

  Widget _filterSelected() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              filtro = Filtro();
            });
            loadDecunicas();
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle),
              padding: const EdgeInsets.all(10),
              child: const Text('X')),
        ),
        const SizedBox(
          width: 10,
        ),
        _buttonFilter(filtro.nombre,
            param: filtro.campo,
            value: filtro.valor,
            seleccionado: filtro.seleccionado),
      ],
    );
  }

  Widget _emtySearch() {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Image(
          image: const AssetImage('assets/images/search-icon.png'),
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        const SizedBox(
          width: 15,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¿Estas buscando alguna orden?',
                style: TextStyle(
                    fontSize: 18.5,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                  'Encuentra tus ordenes de forma fácil, solo ingresar el cliente o número'),
            ],
          ),
        )
      ],
    );
  }

  Widget _filters() {
    return Wrap(
      children: [
        _buttonFilter('Via Maritima', param: 'via', value: 'M'),
        _buttonFilter('Via Aerea', param: 'via', value: 'A'),
        _buttonFilter('Importación', param: 'regimen', value: 'I'),
        _buttonFilter('Exportación', param: 'regimen', value: 'S'),
        _buttonFilter('Canal Verde', param: 'tip_aforo', value: 'V'),
        _buttonFilter('Canal Naranja', param: 'tip_aforo', value: 'N'),
        _buttonFilter('Canal Rojo', param: 'tip_aforo', value: 'R')
      ],
    );
  }

  Widget _buttonFilter(text, {param, value, seleccionado = false}) {
    return GestureDetector(
      onTap: () {
        if (!filtro.seleccionado) {
          setState(() {
            filtro = Filtro(
                nombre: text, campo: param, valor: value, seleccionado: true);
          });
          loadDecunicas();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(51, 68, 106, 1)),
            borderRadius: BorderRadius.circular(10),
            color:
                seleccionado ? Color.fromRGBO(51, 68, 106, 1) : Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.only(right: 8, bottom: 5),
        child: Text(
          '$text',
          style: TextStyle(
              color:
                  seleccionado ? Colors.white : Color.fromRGBO(51, 68, 106, 1),
              fontSize: 14),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.white, fontSize: 17),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color.fromRGBO(82, 110, 170, 1),
              hintText: "Buscar...",
              hintStyle: const TextStyle(color: Colors.white30),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.white30,
            ),
          ),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Text(
            'Cancelar',
            style:
                TextStyle(color: Color.fromRGBO(51, 68, 106, 1), fontSize: 16),
          ),
        )
      ],
    );
  }
}
