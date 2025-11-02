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
  double _contador = 0.0; // El valor inicial (Decimal)

  void _actualizar(double valor) {
    setState(() {
      _contador += valor; // Sumar o Restar un valor
    });
  }

  void _resetear() {
    setState(() {
      _contador = 0.0; // Reinicia el valor a 0.0
    });
  }

  void _multiplicar() {
    setState(() {
      _contador *= 2.0; // Duplica el valor actual
    });
  }

  void _dividir() {
    setState(() {
      if (_contador != 0.0) { 
        _contador = _contador / 2.0; // División decimal del valor actual
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
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        
        // Pantalla de Información
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              // Navega a la pantalla de información
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InfoScreen()),
              );
            },
          ),
        ],
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, 
        
        children: <Widget>[
          // Texto del contador (Centrado)
          Expanded(
            child: Center(
              child: Text(
                _contador.toStringAsFixed(2), 
                style: const TextStyle(
                  fontSize: 60, 
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo, 
                ),
              ),
            ),
          ),
          
           // Botones de la pagina principal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: <Widget>[

              // Botón Restar 
              FloatingActionButton(
                onPressed: () => _actualizar(-1.0),
                heroTag: "btn_restar",
                backgroundColor: Colors.indigo, 
                 child: const Icon(Icons.remove, color: Colors.white), 
              ),

              // Botón Sumar 
              FloatingActionButton(
                onPressed: () => _actualizar(1.0),
                heroTag: "btn_sumar",
                backgroundColor: Colors.indigo, 
                child: const Icon(Icons.add, color: Colors.white),
              ),
              
              // Botón Multiplicar 
              FloatingActionButton(
                onPressed: _multiplicar,
                heroTag: "btn_multiplicar",
                backgroundColor: Colors.indigo, 
                child: const Icon(Icons.close, color: Colors.white),
              ),

              // Botón Dividir 
              FloatingActionButton(
                onPressed: _dividir,
                heroTag: "btn_dividir",
                backgroundColor: Colors.indigo, 
                child: const Icon(Icons.data_usage, color: Colors.white),
              ),
              
              // Botón de Resetear 
              FloatingActionButton(
                onPressed: _resetear,
                heroTag: "btn_reset",
                backgroundColor: Colors.indigo, 
                child: const Icon(Icons.refresh, color: Colors.white),

              ),
            ],
          ),
          const SizedBox(height: 20), 
        ],
      ),
    );
  }
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información del Desarrollador'),
        backgroundColor: Colors.indigo,
        // Habilita el botón de retroceso automático
      ),
      
 body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contador',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 20),

            // Información del desarrollador (usa tus datos)
            const Text(
              'Desarrollado por: Laury Guerrero (Pastelblue05)', 
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            
            const Text(
              'App info: Contador de numero decimales, se puede sumar, restar, multiplicar, dividir y resetear', 
              style: TextStyle(fontSize: 16),
            ),
            
            const Text(
              'Fecha de creación: 01/11/2025', 
              style: TextStyle(fontSize: 16),
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}