import 'package:flutter/material.dart';
import 'package:recetas_app/my_app.dart';

class Receta extends StatefulWidget {
  const Receta({super.key, required this.receta});

  final RecetaInfo receta;

  @override
  State<Receta> createState() => _RecetaState();
}

class _RecetaState extends State<Receta> {

  IconData favorite = Icons.star_border;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:  Text(widget.receta.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(favorite),
            onPressed: () {
              
              setState(() {
                if(favorite == Icons.star_border){
                  favorite = Icons.star;
                }else{
                  favorite = Icons.star_border;
                }
              });
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              final snackBar1 = SnackBar(
                  content: const Text('Agregado a Favoritos!'),
                  duration: const Duration(seconds:2),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                  label: 'Cerrar',
                  textColor: Colors.white,
                  onPressed: () {},
                  ),
              );
              final snackBar2 = SnackBar(
                  content: const Text('Eliminado de Favoritos'),
                  duration: const Duration(seconds:2),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                  label: 'Cerrar',
                  textColor: Colors.white,
                  onPressed: () {},
                  ),
              );
              if(favorite == Icons.star_border){
                  ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                }
              
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
                children: [
                  Image.asset(widget.receta.image),
                  const Text("Ingredients", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 236, 202, 157)),),
                  const SizedBox(height: 10,),
                  Text(widget.receta.ingredients.join("\n"), style: const TextStyle(fontSize: 14, color: Colors.white),textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  const Text("Steps", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 236, 202, 157)),),
                  const SizedBox(height: 10,),
                  Text(widget.receta.steps.join("\n"), style: const TextStyle(fontSize: 13, color: Colors.white),textAlign: TextAlign.center,),
                ],
              )
        // ElevatedButton(
        //   onPressed: (){
        //     Navigator.pop(context);
        //   },
        //   child:  Image.asset(widget.receta.image)),
      ),
    );
  }
}