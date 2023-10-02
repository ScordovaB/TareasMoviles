import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';

class Multiplica extends StatefulWidget {
  const Multiplica({super.key});

  @override
  State<Multiplica> createState() => _MultiplicaState();
}

class _MultiplicaState extends State<Multiplica> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            context.watch<CounterProvider>().counter.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().multiDos();
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      final snackBar1 = SnackBar(
                        content: const Text('Se multiplico por 2!'),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: 'Cerrar',
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                    },
                    child: const Text("x2")),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().multiTres();
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      final snackBar1 = SnackBar(
                        content: const Text('Se multiplico por 3!'),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: 'Cerrar',
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                    },
                    child: const Text("x3")),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().multiCinco();
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      final snackBar1 = SnackBar(
                        content: const Text('Se multiplico por 5!'),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: 'Cerrar',
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                    },
                    child: const Text("x5"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
