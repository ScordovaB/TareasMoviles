import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  ItemActividad({super.key, required this.day, required this.place,required this.image});

  final int day;
  final String place;
  final String image;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('./assets/images/$image', fit: BoxFit.fill)
                      ),
          ),
          Text("Day $day", style: TextStyle(fontSize: 11)),
          Text("$place", style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}