import 'package:flutter/material.dart';
import 'package:provider_class/Screens/mult.dart';
import 'package:provider_class/Screens/prime.dart';
import 'package:provider_class/Screens/suma_resta.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage= 0;

  final List<Widget> _pages = [
    const SumaResta(),
    const Multiplica(),
    const Primo()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contador 2.0'),
        ),
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },  
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.one_k), label: 'Suma'),
            BottomNavigationBarItem(icon: Icon(Icons.two_k), label: 'Multiplica'),
            BottomNavigationBarItem(icon: Icon(Icons.three_k), label: 'Primo')
          ],
        ),
      ),
    );
  }
}