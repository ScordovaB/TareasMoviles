import 'package:flutter/material.dart';
import 'package:recetas_app/receta.dart';

class RecetaInfo{
  final String title;
  final String image;
  final String time;
  final String difficulty;
  final String price;
  final List<String> ingredients;
  final List<String> steps;

  RecetaInfo(this.title, this.image, this.time, this.difficulty, this.price, this.ingredients, this.steps);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.recetas});

  final List<RecetaInfo> recetas;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:const Color.fromARGB(255, 32, 27, 26),
      ),
      title: 'Recetas App',
      home: Scaffold(
        
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          
          title: const Text('Quick & Easy'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
      itemCount: recetas.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          
          child: InkWell(
            onTap: () {
              // Add your onTap action here for each item
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Receta(receta: recetas[index]),
                ),
              );
              //print('Item ${recetas[index].title} tapped!');
            },
            child: Stack(
              
              alignment: Alignment.center,
              children: [
                Image.asset(
                  recetas[index].image,
                  width: 400,
                  height: 180,
                  fit: BoxFit.cover,
                  
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,

                  child: Container(
                   color: Colors.black.withOpacity(.6),
                   alignment: Alignment.bottomCenter,
                   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    
                    
                    children: [
                      Text(
                        recetas[index].title,
                        style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.schedule,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(width: 5,),
                          Text(recetas[index].time,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 20,),
                          const Icon(Icons.work,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(width: 5,),
                          Text(recetas[index].difficulty,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 20,),
                          const Icon(Icons.attach_money,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(width: 5,),
                          Text(recetas[index].price,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                 ),
                  
                ),
                 
                
              ],
            ),
          ),
        );
      },
      )
      ),
    );
  }
}