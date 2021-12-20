//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/widget/meal_item.dart';
import '../widget/dummy_data.dart';
import '../screens/categories_screen.dart';
import '../screens/Category_meals.dart';
import '../model/Meal.dart';

class CategoryMeal extends StatefulWidget {
static const routeName='/Category_meals';
final List<Meal> availableMeal;
CategoryMeal(this.availableMeal);

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {

  @override
  String categoryTitle;
  List<Meal> displayedMeals;
  void initState() {

super.initState();
  }
  @override
  void didChangeDependencies() {
    bool _loadedInitData=false;
    if(!_loadedInitData) {
      final routeAr = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeAr['title'];
      final categoryId = routeAr['id'];
      displayedMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle,style: GoogleFonts.zillaSlab(),),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(id:displayedMeals[index].id,title: displayedMeals[index].title, duration: displayedMeals[index].duration, imageUrl:displayedMeals[index].imageUrl, affordability:displayedMeals[index].affordability, complexity: displayedMeals[index].complexity);
    },itemCount:displayedMeals.length ,
      ),
    );
  }
}
