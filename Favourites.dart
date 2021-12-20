import 'package:flutter/cupertino.dart';
import 'package:meals_app/model/Meal.dart';
import 'package:meals_app/widget/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteMeals;

  Favourites(this.favouriteMeals);


  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Container(
          child: Text('You have no favourites yet!!'),
        ),
      );
    }
    else {
      return ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
          id: favouriteMeals[index].id,
          title: favouriteMeals[index].title,
          duration: favouriteMeals[index].duration,
          imageUrl: favouriteMeals[index].imageUrl,
          affordability: favouriteMeals[index].affordability,
          complexity: favouriteMeals[index].complexity,
        );
      }, itemCount: favouriteMeals.length,
      );
    }
  }
}
