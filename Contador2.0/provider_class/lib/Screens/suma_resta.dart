import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';

class SumaResta extends StatefulWidget {
  const SumaResta({super.key});

  @override
  State<SumaResta> createState() => _SumaRestaState();
}

class _SumaRestaState extends State<SumaResta> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.watch<CounterProvider>().counter.toString(),
            style: const TextStyle(fontSize: 30),),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().increment();
                    },
                    child: const Text("+")),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().decrement();
                    },
                    child: const Text("-")),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().reset();
                    },
                    child: const Text("Reiniciar"))
                ],
              ),
           ),
        ],
      ),
    );
  }
}