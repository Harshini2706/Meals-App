import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/Category_meals.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tab%20screen.dart';

class MainDrawer extends StatelessWidget {

  Widget BuildIcon(String title,IconData icon,Function tapHandler){
  return ListTile(
    leading: Icon(icon),
    title: Text(title,style: GoogleFonts.chelseaMarket(),),
    onTap: tapHandler(),
  );
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(height: 120,
              width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          color: Theme.of(context).primaryColor,
          child: Text('Cooking Up!!',style: GoogleFonts.zillaSlab(fontSize: 25),),
          ),
          SizedBox(
            height: 10,
          ),
         //BuildIcon('Meal',Icons.restaurant,(){}),
          BuildIcon('Filters', Icons.settings,(){ Navigator.of(context).pushNamed(Filter.routeName);}),
          BuildIcon('Items', Icons.category,(){Navigator.of(context).pushNamed(Tabs_Screen.routeName);})

        ],
      ),
    );
  }
}
