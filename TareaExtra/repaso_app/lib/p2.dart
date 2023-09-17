import 'dart:math';
import 'package:flutter/material.dart';


class P2 extends StatefulWidget {
  const P2({super.key, required this.texto, required this.callback});

  final String texto;
  final  Function(String) callback;

  @override
  State<P2> createState() => _P2State();
}

class _P2State extends State<P2> {

  int random = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context,random);
            },
          ),
          automaticallyImplyLeading: true,
          title: const Text('Pagina 2'),
        ),
        body:  Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [Colors.lightBlue.shade300, Colors.lightBlue.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            )
          ),
          child: Center(
            
            child: Column(
              children: [
                const SizedBox(height: 30,),
                const Text("Genere numero random", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),
                const SizedBox(height: 20,),
                Text("$random", style: const TextStyle(fontSize:25, color: Colors.red, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      
                      random = Random().nextInt(200);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                  child: const Text('Generar'),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //widget.texto = random.toString() + widget.texto;
                      widget.callback(random.toString());
                      Navigator.pop(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                  child: const Text('Guardar'),
                )
              ]
            )
          ),
        ),
      ),
    );
  }
}