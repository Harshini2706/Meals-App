import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/model/Meal.dart';
import '../screens/Meal_detail.dart';
class MealItem extends StatelessWidget {
  final String id;
final String title;
  final int duration;
  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
      return 'Simple';
      break;

      case Complexity.Normal:
      return 'Normal';

      case Complexity.Challenging:
      return 'Challenging';
      break;

      case Complexity.Hard:
      return 'Hard';
      break;

      default:
        return 'Unknown';
    }
  }
  String get affordabilityText{
    switch(affordability){
      case  Affordability.Luxurious:
      return 'Luxurious';
      break;

      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.worth:
        return 'worth';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;

      default:
        return 'Unknown';
    }
  }
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(Meal_detail.routeName, arguments: id)
        .then((result) =>
    {if(result!=null){
      //removeItem(result)
    }
    });
  }
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({@required this.id,@required this.title,@required this.duration,@required this.imageUrl,@required this.affordability,@required this.complexity});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child: Card(
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(children: [
             ClipRRect(borderRadius: BorderRadius.only(
               topLeft: Radius.circular(15),
               topRight: Radius.circular(15),

             ),child:Image.network(imageUrl,height: 250,width: double.infinity,fit: BoxFit.cover,) ,),
              Positioned(bottom:20,left: 5,child: Container(width:300,color:Colors.black54,padding:EdgeInsets.all(15),child: Text(title,style: GoogleFonts.chelseaMarket(),softWrap: true,overflow: TextOverflow.fade,)))
            ],),Padding(padding: EdgeInsets.all(15),child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Row(children:[
              Icon(Icons.schedule),
              SizedBox(
                width: 6,
              ),
              Text('$duration min')
            ],),

               Row(children: [
                  Icon(Icons.work),
                  SizedBox(
                    width: 6,
                  ),
                  Text(complexityText),
                ],),
              Row(children: [
                Icon(Icons.attach_money),
                SizedBox(
                  width: 6,
                ),
                Text(affordabilityText),
              ],)
                ]),

    ),],
        ),
      ),
    );
  }
}
