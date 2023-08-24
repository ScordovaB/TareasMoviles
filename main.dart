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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'McFlutter App 2'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _McFlutter();
}

class _McFlutter extends State<MyHomePage> {
  //const McFlutter({super.key});

  //Color _clickColor = Colors.black;
  bool _click = true;
  bool _click2 = true;
  bool _click3 = true;
  bool _click4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle:
              false, //Le decimos que no este centrado ya que el default en iOS es centrado
          backgroundColor: const Color.fromARGB(255, 32, 123, 213),
          title: const Text(
            'Mc Flutter',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          height: 150,
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
          decoration:BoxDecoration(border: Border.all(width: 1.5),),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  Icon(
                    Icons.account_circle,
                    size: 55,),
                  Column(
                    children: [
                      Text("Flutter McFlutter",style: TextStyle(fontSize: 24)),
                      Text("Experienced App Developer")
                    ],
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("123 Main Street"),
                  Text("(415) 555-0198")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   IconButton(
                    iconSize: 24,
                    icon:  Icon(Icons.accessibility, color: _click? Colors.black : Colors.indigo,),
                    onPressed: (){ 
                      setState(() {
                        _click = !_click;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 24,
                    icon:  Icon(Icons.access_time_filled, color: _click2? Colors.black : Colors.indigo,),
                    onPressed: (){ 
                      setState(() {
                        _click2 = !_click2;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 24,
                    icon:  Icon(Icons.phone_android, color: _click3? Colors.black : Colors.indigo,),
                    onPressed: (){ 
                      setState(() {
                        _click3 = !_click3;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 24,
                    icon:  Icon(Icons.phone_iphone, color: _click4? Colors.black : Colors.indigo,),
                    onPressed: (){ 
                      setState(() {
                        _click4 = !_click4;
                      });
                    },
                  ),
                ],
              ),

            ],
          ),
        ));
  }
}
