//@dart=2.0
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/dummy_data.dart';

class Meal_detail extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function togglefavourite;
  final Function isfavourite;
  Meal_detail(this.togglefavourite,this.isfavourite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(
          text,
          style: GoogleFonts.doppioOne(color: Colors.lightBlueAccent),
        ));
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 130,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedMeal.title}',
          style: GoogleFonts.zillaSlab(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(
            context,
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).primaryColorLight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectedMeal.ingredients[index]),
                ),
                elevation: 4,
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          buildContainer(              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(children:[ListTile(
                  leading: CircleAvatar(
                    child: Text('#${index+1}'),
                  ),
                  title: Text(selectedMeal.steps[index]),
                ),Divider()
                ]),
                itemCount: selectedMeal.steps.length,
              ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed:()=>togglefavourite(mealId),child: Icon(isfavourite(mealId)?Icons.star:Icons.star_border),)
    );
  }
}
