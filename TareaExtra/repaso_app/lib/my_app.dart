import 'package:flutter/material.dart';
import 'package:repaso_app/p2.dart';
import 'package:repaso_app/p3.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  //final String title;

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  String pag2='';
  String randomNum ='';
  String pag3='';

  void _navigateToSecondScreen(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => P2(
        callback: (returnedValue) {

          //print("randomNum: $randomNum");
          setState(() {
            randomNum = pag2 + returnedValue;
          });
        },
        texto: pag2,
      ),
    ),
  );
  
  }
  void _navigateToThirdScreen(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => P3(
        callback: (returnedValue) {         
          setState(() {
            pag3 = returnedValue;
          });
        },
      ),
    ),
  );
  
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: true,
          title: const Text('Tarea 1'),
        ),
        body:  Center(
          child: Column(
            children: [
              const Text('BIENVENIDOS',
               style: TextStyle(fontSize: 30, fontFamily: 'Pacifico', color: Colors.grey),),
              const Image(
                image: NetworkImage("https://www.kindpng.com/picc/m/176-1766643_come-to-the-dart-side-flutter-custom-bottom.png")),
              //Espacio entre imagen y texto
              const SizedBox(height: 30,),
              const Text('Seleccione la accion a realizar:',
               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   ElevatedButton(
                    onPressed: () {
                      showDialog(context: context,
                       builder: (BuildContext context) => 
                       AlertDialog(
                        title: const Text('Ingrese Datos'),
                        content: TextField(
                          onChanged: (String value) {
                            setState(() {
                              pag2 = value;
                            });
                          },
                          decoration: const InputDecoration(hintText: "Ingrese palabra"),
                          maxLength: 10,
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancelar')
                          ),
                          TextButton(
                            onPressed: () {
                              
                                Navigator.pop(context,'OK'); 
                                
                                _navigateToSecondScreen(context);
                                
                              },
                            child: const Text('Aceptar'),
                          ),
                        ],
                      )
                       );
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Página 2'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _navigateToThirdScreen(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Página 3'),
                  ),
                  
                ],
              ),
              const SizedBox(height: 40,),
              Text("Pg2 =>$randomNum"),
              const SizedBox(height: 20,),
              Text("Pg3 =>$pag3"),
            ],
          ),
        ),
      ),
    );
  }
}
