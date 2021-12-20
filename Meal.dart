import 'package:flutter/cupertino.dart';

enum Complexity { Simple, Challenging, Hard, Normal }
enum Affordability { Affordable, Pricey, worth, Luxurious }

class Meal {

  final id;
  final List <String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool Is_vegan;
  final bool Is_sugar_Free;
  final bool Is_Vegetarian;
  final bool Is_GlutenFree;


  Meal({@required this.title,
    this.id, @required this.categories, @required this.imageUrl, @required this.ingredients, @required this.steps, @required this.duration, @required this.complexity, @required this.affordability, @required this.Is_GlutenFree, @required this.Is_sugar_Free, @required this.Is_vegan, @required this.Is_Vegetarian});
}