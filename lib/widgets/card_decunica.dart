import 'package:TrackingASL/data/decunica.dart';
import 'package:flutter/material.dart';

class CardDecunica extends StatelessWidget {
  final Decunica? decunica;

  const CardDecunica({super.key, this.decunica});

  @override
  Widget build(BuildContext context) {
    
    String? id = decunica?.id;
    String? via = decunica?.via;
    String? cliente = decunica?.cliente;
    String? canal = decunica?.canal;
    String? regimen = decunica?.regimen;

    Color colorCanal = Colors.grey;
    if (!(canal!.isEmpty)) {
      if (canal == 'VERDE') {
        colorCanal = Colors.green;
      }
      if (canal == 'NARANJA') {
        colorCanal = Colors.deepOrange;
      }
      if (canal == 'ROJO') {
        colorCanal = Colors.red;
      }
    }
    
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: decunica);
      },
      child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  via == '--'
                      ? Icons.linear_scale
                      : (via == 'MARITIMO'
                          ? Icons.directions_boat_filled
                          : Icons.airplanemode_on_rounded),
                  size: 50,
                ),
                title: Text(
                  '$id',
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  children: [
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Text('$cliente')),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*Container(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 2, bottom: 2),
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0))),
                          child: Text(
                            via,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10.0),*/
                        Container(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 2, bottom: 2),
                          decoration: BoxDecoration(
                              color: colorCanal,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0))),
                          child: Text(
                            '$canal',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 2, bottom: 2),
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0))),
                          child: Text(
                            '$regimen',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}