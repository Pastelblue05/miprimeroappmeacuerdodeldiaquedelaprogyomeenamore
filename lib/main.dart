// Myprimerapp
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContadorPage(),
    );
  }
}

class ContadorPage extends StatefulWidget {
  const ContadorPage({super.key});
  @override
  State<ContadorPage> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  //Funciones pantalla principal
  int _contador = 0; // El valor inicial 

  void _actualizar(int valor) {
    setState(() {
      _contador += valor; // Sumar o Restar un valor
    });
  }

  void _resetear() {
    setState(() {
      _contador = 0; // Reinicia el valor a 0
    });
  }

  void _multiplicar() {
    setState(() {
      _contador *= 2; // Duplica el valor actual
    });
  }

  void _dividir() {
    setState(() {
      if (_contador != 0) { 
        _contador = _contador ~/ 2; // División entera del valor actual
      }
    });
  }

  // Diseño de la pantalla principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        backgroundColor: Colors.indigo,
      ),
      
      // Body para alinear los elementos en una columna al final
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, 
        
        children: <Widget>[
          // Texto del contador 
          Center(
            child: Text(
              '$_contador',
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          
          // Botones de la pagina principal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: <Widget>[

              // Botón Restar 
              FloatingActionButton(
                onPressed: () => _actualizar(-1),
                heroTag: "btn_restar",
                child: const Icon(Icons.remove),
              ),

              // Botón Sumar 
              FloatingActionButton(
                onPressed: () => _actualizar(1),
                heroTag: "btn_sumar",
                child: const Icon(Icons.add),
              ),
              
              // Botón Multiplicar 
              FloatingActionButton(
                onPressed: _multiplicar,
                heroTag: "btn_multiplicar",
                child: const Icon(Icons.close),
              ),

              // Botón Dividir 
              FloatingActionButton(
                onPressed: _dividir,
                heroTag: "btn_dividir",
                child: const Icon(Icons.data_usage),
              ),
              
              // Botón de Resetear 
              FloatingActionButton(
                onPressed: _resetear,
                heroTag: "btn_reset",
                child: const Icon(Icons.refresh),

              ),
            ],
          ),          
          const SizedBox(height: 20), 
        ],
      ),
    );
  }
}