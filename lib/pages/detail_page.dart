import 'package:TrackingASL/data/decunica.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _callme();
  }

  _callme() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Decunica decunica = ModalRoute.of(context)?.settings.arguments as Decunica;
    const Center(child: CircularProgressIndicator());

    return !isLoaded ? const Center(child: CircularProgressIndicator()) : Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(51, 68, 106, 1),
          title: const Text(""),
          foregroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(orden: decunica.id, cliente: decunica.cliente),
            _via(),
            const SizedBox(height: 15),
            _canal(label: 'Canal', value: decunica.canal),
            Row(
              children: [
                _fechas(label: 'Fecha de Llegada', value: decunica.fecha_llegada),
                _fechas(label: 'Fecha de Retiro', value: decunica.fecha_retiro),
              ],
            ),
            Row(
              children: [
                _fechas(label: 'Fecha de Numeración', value: decunica.fecha_declaracion),
                _fechas(label: 'Fecha de Levante', value: decunica.fecha_levante),
              ],
            ),
            _dam(decunica.via, decunica.dam)
          ],
        ));
  }

  Widget _dam(String? via, String? dam) {
    return Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  blurRadius: 4.5,
                  blurStyle: BlurStyle.outer)
            ]),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(
              via == '--' ? Icons.linear_scale : (via == 'MARITIMO' ? Icons.directions_boat_filled : Icons.airplanemode_on_rounded),
              color: Colors.blue,
              size: 40.0,
            ),
            const SizedBox(width: 15),
            Column(
              children: [
                const Text("DAM", style: TextStyle(color: Colors.grey)),
                Text('$dam',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ));
  }

  Widget _via() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.red),
      child: const Center(
          child: Text(
        "Maritima",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
      )),
    );
  }

  Widget _header({String? orden, String? cliente}) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(51, 68, 106, 1),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 5),
            child: Text(
              '$orden',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              '$cliente',
              style: const TextStyle(
                  color: Color.fromRGBO(82, 110, 170, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fechas({label, value}) {
    return Expanded(
      flex: 5,
      child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 4.5,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            children: [
              const Icon(Icons.date_range_outlined, color: Colors.grey),
              Text(label,
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
              Text(value,
                  style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold))
            ],
          )),
    );
  }

  Widget _canal({label, String? value}) {
    Color color = Colors.grey;
    if(!(value!.isEmpty)) {
        if(value == 'VERDE') {
          color = Colors.green;
        }
        if(value == 'NARANJA') {
          color = Colors.deepOrange;
        }
        if(value == 'ROJO') {
          color = Colors.red;
        }
    }

    return Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  blurRadius: 4.5,
                  blurStyle: BlurStyle.outer)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.flag,
              color: color,
              size: 40.0,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text(label, style: const TextStyle(color: Colors.grey)),
                Text(value,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ));
  }
}
