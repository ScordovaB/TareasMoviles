import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';

class Primo extends StatefulWidget {
  const Primo({super.key});

  @override
  State<Primo> createState() => _PrimoState();
}

class _PrimoState extends State<Primo> {

  @override
  void initState() {
    
    context.read<CounterProvider>().isPrime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.watch<CounterProvider>().primo.toString(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold ,color: context.watch<CounterProvider>().colorPrimo)),
        ],
      ),   
    );
  }
}