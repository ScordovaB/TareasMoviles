import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 41, 69, 141)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ITESO APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _click = true;
  bool _click2 = true;
  bool _click3 = true;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.network(
                    'https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg'),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Iteso y boton me gusta
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'El ITESO, Univerisdad Jesuita de Guadalajara',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          Text(
                            "San Pedro Tlaquepaque, Jal.",
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            iconSize: 24,
                            icon: const Icon(
                              Icons.thumb_up_sharp,
                              color: Colors.indigo,
                            ),
                            onPressed: _incrementCounter,
                          ),
                          Text('$_counter')
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24,),
                //Botones correo, telefono etc
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Column(
                      children: [
                        IconButton(
                          iconSize: 50,
                          icon:  Icon(Icons.mail, color: _click? Colors.black : Colors.indigo,),
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            final snackBar = SnackBar(
                              content: const Text('Correo Iteso: servicios@iteso.mx'),
                              duration: const Duration(seconds:2),
                              action: SnackBarAction(
                                label: 'Cerrar',
                                onPressed: () {
                                  //codigo extra
                                  
                                },
                              ),
                            );
                            
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            setState(() {
                              _click = !_click;
                            });
                          },
                        ),
                        const Text("Correo", style: TextStyle(fontWeight: FontWeight.w600),),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          iconSize: 50,
                          icon:  Icon(Icons.add_call, color: _click2? Colors.black : Colors.indigo,),
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            final snackBar = SnackBar(
                              content: const Text('Llama al 01-800-ITESO'),
                              action: SnackBarAction(
                                label: 'Cerrar',
                                onPressed: () {
                                  //codigo extra
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            setState(() {
                              _click2 = !_click2;
                            });
                          },
                        ),
                        const Text("Llamada", style: TextStyle(fontWeight: FontWeight.w600))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          iconSize: 50,
                          icon:  Icon(Icons.directions, color: _click3? Colors.black : Colors.indigo,),
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            final snackBar = SnackBar(
                              content: const Text('Anillo Perif. Sur Manuel Gómez Morín 8585'),
                              action: SnackBarAction(
                                label: 'Cerrar',
                                onPressed: () {
                                  //codigo extra
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            setState(() {
                              _click3 = !_click3;
                            });
                          },
                        ),
                        const Text("Direcciones",style: TextStyle(fontWeight: FontWeight.w600),)
                      ],
                    ),
                    
                  ],
                ),
                const SizedBox(height: 64,),
                const Padding(
                  padding:  EdgeInsets.fromLTRB(20, 0, 20, 14),
                  child:  Text('''ITESO, Universidad Jesuita de Guadalajara, distinta de la Universidad de Guadalajara, también conocida como Instituto Tecnológico y de Estudios Superiores de Occidente, ITESO.
Es una universidad jesuita en el estado de Jalisco, en el oeste de México, ubicada en el municipio de Tlaquepaque en el Área Metropolitano de Guadalajara.''',
                  textAlign: TextAlign.justify,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                )
              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
