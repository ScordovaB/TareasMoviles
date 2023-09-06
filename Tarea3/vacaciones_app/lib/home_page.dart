import 'package:flutter/material.dart';
import './info_lugar.dart';
import './item_actividad.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  final List<int> days = [1,2,3,4,5,6,7,8,9,10];
  final List<String> places = [
    'Playa del Carmen',
    'Cancun',
    'Tulum',
    'Riviera Maya',
    'Cozumel',
    'Isla Mujeres',
    'Bacalar',
    'Holbox',
    'Mahahual',
  ];
  final List<String> images = [
    'playa_carmen.jpg',
    'cancun.jpg',
    'tulum.jpg',
    'riviera_maya.jpg',
    'cozumel.jpg',
    'isla_mujers.png',
    'bacalar.jpg',
    'holbox.jpg',
    'mahahual.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              
              Align(
                alignment: Alignment.topCenter,
                child:ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('./assets/images/playaP.jpg', fit: BoxFit.fill,width: 400, height: 180)
                      )
                ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back),
                    alignment: Alignment.topLeft ,iconSize: 30, color: Colors.white, ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 110,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],

                          ),
                          
                          child: const Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                                                        
                            children: [Icon(Icons.edit_rounded, size: 18,) ,Text(" Details")],
                          ),
                        ),
                        const Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    //LIST VIEW para ver los items
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(day: days[index],place: places[index],image: images[index],);
                        },
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      //alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: MaterialButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              final snackBar = SnackBar(
                                content: const Text('Reservación en progreso'),
                                duration: const Duration(seconds:2),
                                behavior: SnackBarBehavior.floating,
                                action: SnackBarAction(
                                  label: 'Cerrar',
                                  textColor: Colors.white,
                                  onPressed: () {
                                    //codigo extra
                                    
                                  },
                                ),
                              );
                              
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        color: Colors.red,
                        hoverColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        textColor: Colors.white,
                        child: const Text("Start booking",),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}