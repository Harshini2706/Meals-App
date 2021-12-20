import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/model/Meal.dart';
import 'package:meals_app/screens/Cat.dart';
import 'package:meals_app/screens/Category_meals.dart';
import 'package:meals_app/screens/Meal_detail.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tab%20screen.dart';
import 'package:meals_app/widget/dummy_data.dart';

void main() {
  runApp(Foodie());
}

class Foodie extends StatefulWidget {


  @override
  _FoodieState createState() => _FoodieState();
}

class _FoodieState extends State<Foodie> {
  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegeterian':false
  };
  List<Meal> availableMeals=DUMMY_MEALS;
  List<Meal> favouriteMeals=[];
  void _setfilters(Map<String,bool>filterData){
setState(() {
  _filters=filterData;
  availableMeals=DUMMY_MEALS.where((meal){
    if((_filters['gluten']&& !meal.Is_GlutenFree)){
      return false;
    }
    if((_filters['vegan']&& !meal.Is_vegan)){
      return false;
    }
    if((_filters['Vegeterian']&& !meal.Is_Vegetarian)){
      return false;
    }
    if((_filters['lactose']&& !meal.Is_sugar_Free)){
      return false;
    }
    return true;
  }).toList();
});
  }
  void _togglefavourite(String mealId){
    final existingIndex=favouriteMeals.indexWhere((meal) => meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }
  bool _isfavourite(String id){
  return favouriteMeals.any((meal) => meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,

          accentColor: Colors.pinkAccent,//iconTheme: ThemeData.dark().iconTheme.copyWith(color: Colors.black),
         textTheme: ThemeData.light().textTheme.copyWith(
    body1: GoogleFonts.imFellFrenchCanon(color: Color.fromARGB(220, 200, 100, 100),),
           body2: GoogleFonts.zillaSlab(color: Color.fromARGB(255, 254, 229, 1),),
           title: GoogleFonts.cutiveMono(fontSize: 20,fontWeight: FontWeight.bold))

    ),


      routes: {

        '/':(ctx)=>Tabs_Screen(favouriteMeals),

        CategoryMeal.routeName:(ctx)=>CategoryMeal(availableMeals),
        Meal_detail.routeName:(ctx)=>Meal_detail(_togglefavourite,_isfavourite),
        Filter.routeName:(ctx)=>Filter(_filters,_setfilters),

      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx)=>CategoryMeal(availableMeals));
      },
    );
  }
}
