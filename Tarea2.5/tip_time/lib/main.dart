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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade200),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tip Time'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SingingCharacter { amazing, good, okay }

class _MyHomePageState extends State<MyHomePage> {
  
  bool light = true;

  final controllerCost = TextEditingController();
  @override
  void dispose(){
    controllerCost.dispose();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();
    controllerCost.addListener(() { });
  }
  //Parametros para calcular propina
  double _service = 900;
  int _percentage = 0;
  double _tip = 0;
  bool _rounded = true;
  String _finaltip= '0';

  void _calculateTip(){
    setState(() {
      if(_rounded == true){
        double tipBefore = 0;
        tipBefore = _service * (_percentage / 100);
        _tip = tipBefore.roundToDouble();
        _finaltip = _tip.toString();
      }else{
        _tip = _service * (_percentage / 100);
        
        _finaltip = _tip.toStringAsFixed(2);
      }
    });
  }
  
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
  SingingCharacter? _character = SingingCharacter.amazing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.storefront,
                  color: Color.fromARGB(255, 101, 101, 101),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextField(
                    obscureText: false,
                    controller: controllerCost,
                    onChanged: (value) {
                      _service = double.parse(value);
                    },
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cost of Service',
                      
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.dinner_dining,
                  color: Color.fromARGB(255, 101, 101, 101),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "How was the service?",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 300,
                      height: 35,
                      child: ListTile(
                        title: const Text('Amazing 20%'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.amazing,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                              _percentage = 20;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 35,
                      child: ListTile(
                        title: const Text('Good 18%'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.good,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                              _percentage = 18;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 35,
                      child: ListTile(
                        title: const Text('Okay 15%'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.okay,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                              _percentage = 15;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              
              children: [
                const Icon(
                  Icons.credit_card,
                  color: Color.fromARGB(255, 101, 101, 101),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Round up tip",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(width: 170,),
                SizedBox(
                  width: 50,
                  height: 38,
                  child:
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                    thumbIcon: thumbIcon,
      
                    value: light, 
                    onChanged: (bool value){
                      setState(() {
                        light=value;
                        _rounded = value;
                      });
                    }),
                  ) 
                  
                ),
              ],
            ),
            FilledButton(onPressed: _calculateTip,
             child: const Text('Calculate',textWidthBasis: TextWidthBasis.parent,),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Tip Amount: $_finaltip')
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
