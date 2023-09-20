import 'package:flutter/material.dart';
import 'package:recetas_app/my_app.dart';



void main() {
  List<RecetaInfo> recetas=[
  RecetaInfo(
    "Spaghetti with Tomato sauce",
    "assets/images/spaghetti.jpg",
    "20 mins",
    "Simple",
    "Affordable",
    ["4 Tomatoes", "1 Tablespoon of Olive Oil", "1 Onion", "250g Spaghetti", "Spices"],
    ["Cut the tomatoes and the onion into small pieces.", "Boil some water - add salt to it once it boils.", "Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes."]
  ),
  RecetaInfo(
    "Toast Hawaii",
    "assets/images/toast.jpg",
    "10 mins",
    "Simple",
    "Affordable",
    ["1 Slice White Bread", "1 Slice Ham", "1 Slice Pineapple", "1-2 Slices of Cheese", "Butter"],
    ["Butter one side of the white bread", "Layer ham, the pineapple and cheese on the white bread", "Bake the toast for round about 10 minutes in the oven at 200°C"]
  ),
  RecetaInfo(
    "Classic Hamburger",
    "assets/images/hamburger.jpg",
    "45 mins",
    "Simple",
    "Pricey",
    ["300g Cattle Hack", "1 Tomato", "1 Cucumber", "1 Onion", "Ketchup", "2 Burger Buns"],
    ["Form 2 patties", "Fry the patties for c. 4 minutes on each side", "Quickly fry the buns for c. 1 minute on each side", "Bruch buns with ketchup", "Serve burger with tomato, cucumber and onion"]
  ),
  RecetaInfo(
    "Vegan Salad",
    "assets/images/salad.jpg",
    "10 mins",
    "Simple",
    "Affordable",
    ["1 Avocado", "2 Tomatoes", "1 Cucumber", "1 Onion", "Olive Oil"],
    ["Cut all vegetables into pieces", "Put all vegetable pieces in a bowl", "Add olive oil", "Add spices and salt", "Mix well"]
  ),
  ];
  
  runApp( MaterialApp(
    title: 'Recetas App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor:const Color.fromARGB(255, 38, 30, 30),
    ),
    home: MyApp(recetas: recetas,),
  ));
}