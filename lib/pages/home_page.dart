import 'package:TrackingASL/data/user.dart';
import 'package:TrackingASL/dto/filtro.dart';
import 'package:flutter/material.dart';
import 'package:TrackingASL/data/decunica.dart';
import 'package:TrackingASL/data/service/decunica_service.dart';
import 'package:TrackingASL/widgets/card_decunica.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = true;
  List<Decunica>? decunicas = [];
  String? nombreHeader = '';
  Color bottonNavBgColor = const Color(0xFF17203A);

  @override
  void initState() {
    super.initState();
    _loadUser();
    loadDecunicas();
  }

  Future<void> _loadUser() async {
    final decunicaService = DecunicaService();
    User? user = await decunicaService.user();
    setState(() {
      if (user != null) {
        nombreHeader = user.nombre;
      }
    });
  }

  Future<void> loadDecunicas() async {
    final decunicaService = DecunicaService();
    decunicas = await decunicaService.getAll('all', Filtro());
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(51, 68, 106, 1),
              title: const Text(""),
              automaticallyImplyLeading: false,
              toolbarHeight: kToolbarHeight * 0.3,
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                _header(),
                _searchBar(),
                _title(),
                Expanded(
                  child: decunicas != null
                      ? ListView(
                          children: decunicas!
                              .map((value) =>
                                  CardDecunica(decunica: value))
                              .toList(),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
      color: const Color.fromRGBO(51, 68, 106, 1),
      child: Text(
        'Hola $nombreHeader, Bienvenido!',
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  Widget _searchBar() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/search');
      },
      child: Container(
          width: double.maxFinite,
          padding:
              const EdgeInsets.only(left: 10, bottom: 25, right: 10, top: 5),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(51, 68, 106, 1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(82, 110, 170, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color:  Color.fromRGBO(51, 68, 106, 1)),
                SizedBox(width: 10),
                 Text('Buscar...',
                    style: TextStyle(color: Color.fromRGBO(51, 68, 106, 1))),
              ],
            ),
          )),
    );
  }

  Widget _title() {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: const Text(
        "Tus Ordenes",
        style: TextStyle(
            color: Color.fromRGBO(51, 68, 106, 1),
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }

}
