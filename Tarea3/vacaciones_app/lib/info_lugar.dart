import 'package:flutter/material.dart';

class InfoLugar extends StatelessWidget {
  InfoLugar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // espacio alrededor del container/card
      margin: const EdgeInsets.all(12),
      child: Container(
        // espacio alrededor pero hacia dentro del container
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Titulo con icono y estrellas
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(Icons.surfing, color: Colors.indigo,size: 48,),
              title: TextTop("Bali's Beach"),
              
              subtitle: const Wrap(
                children: [Icon(Icons.star, color: Colors.amber,size: 18,),
                          Icon(Icons.star, color: Colors.amber,size: 18,),
                          Icon(Icons.star, color: Colors.amber,size: 18,),
                          Icon(Icons.star, color: Colors.amber,size: 18,),
                          Icon(Icons.star_border_outlined, color: Colors.amber,size: 18,),
                          Text("4.1",)],
              ),
            ),
            // Datos del hotel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TextTitleTable("Duration"),
                    TextCellTable("7 Days"),
                  ],
                ),
                Column(
                  children: [
                    TextTitleTable("Participants"),
                    TextCellTable("10 People")
                  ],
                ),
                Column(
                  children: [
                    TextTitleTable("Hotel stay"),
                    TextCellTable("5-Star Hotel")
                  ],
                ),
              ],
            ),
            const Divider(),
            // Precio
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextTotalPrice("Trip Price"),
                const Text("\$1225.00/Adult"),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Metodos que retornan un Text pero estilizado
  Widget TextTop(String text) => Text(
        text,
        style: MyTextStyles().topTitle,
      );
  Widget TextTitleTable(String text) => Text(
        text,
        style: MyTextStyles().catagoryTable,
      );
  Widget TextCellTable(String text) => Text(
        text,
        style: MyTextStyles().cellTable,
      );
  Widget TextTotalPrice(String text) => Text(
        text,
        style: MyTextStyles().totalPrice,
      );
}

class MyTextStyles {
  final TextStyle topTitle = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w900,
  );
  final TextStyle catagoryTable = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
  );
  final TextStyle cellTable = TextStyle(fontSize: 14);
  final TextStyle totalPrice = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}