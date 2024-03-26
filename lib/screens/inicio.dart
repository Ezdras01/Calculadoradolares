import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final pesoMexicano = TextEditingController();
  final dolares = TextEditingController();

  final test = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pesoMexicano.dispose();
    dolares.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text('Convertidor de divisas'),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text("Introduce el valor del dollar"),
            ),
          ),
          Center(
              child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Dollar',
                ),
                controller: dolares,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Introduce la cantidad a convertir"),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Peso Mexicano',
                ),
                controller: pesoMexicano,
              ),
              Center(
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () {

                          var dolares_input = double.parse(this.dolares.text);
                          var pesoMexicano_input = double.parse(this.pesoMexicano.text);

                          var total = pesoMexicano_input / dolares_input;

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Retrieve the text the that user has entered by using the
                                // TextEditingController.
                                content: Text("Dolar ${dolares.text} Peso mx${pesoMexicano.text} \n Total:${total.toStringAsFixed(2) } dolares"),
                              );
                            },
                          );
                        },
                        child: Text('Convertir'),
                      )),
                ]),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
