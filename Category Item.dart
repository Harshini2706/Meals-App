import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/Category_meals.dart';
import 'dummy_data.dart';
class Category_Item extends StatelessWidget {
  final String id;
 final String title;
 final Color color;
 void select(BuildContext ctx){
   Navigator.of(ctx).pushNamed(CategoryMeal.routeName,arguments: {'id':id,'title':title});
 }
Category_Item(  this.color, this.title, this.id);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> select(context),
      splashColor: Theme.of(context).primaryColorLight,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(

        padding: const EdgeInsets.all(15),
      child: Text(title,style: Theme.of(context).textTheme.title,),
      decoration: BoxDecoration(gradient: LinearGradient(colors: [color.withOpacity(0.7),
      color,],begin: Alignment.topLeft,end: Alignment.bottomRight,),
      borderRadius: BorderRadius.circular(15.0),border:Border.all(color: Theme.of(context).primaryColorLight) ),
      ),
    );
  }
}
