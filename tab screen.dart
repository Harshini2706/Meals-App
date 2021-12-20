import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/model/Meal.dart';
import 'package:meals_app/screens/Favourites.dart';
import 'package:meals_app/widget/main_drawer.dart';
import '../screens/categories_screen.dart';
class Tabs_Screen extends StatefulWidget {
  static const routeName = '/Tabs_Screen';
  final List<Meal> favouriteMeals;
  Tabs_Screen(this.favouriteMeals);
  @override
  Tabs_ScreenState createState() => Tabs_ScreenState();
}

class Tabs_ScreenState extends State<Tabs_Screen> {

   List<Map<String,Object>> _pages;
  int _selectedPageIndex=0;
  @override
  void initState() {
     _pages=[
      {"page":Category_Field(),"title":'Categories',},
      {"page":Favourites(widget.favouriteMeals),"title":'Favourites'}
    ];
    super.initState();
  }
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),


    ),
      drawer:MainDrawer(),

      body: _pages[_selectedPageIndex]['page'] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage,
        backgroundColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Colors.black,
        selectedIconTheme: ThemeData.dark().iconTheme.copyWith(color:Colors.pinkAccent),
        unselectedIconTheme: Theme.of(context).iconTheme,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,

      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(backgroundColor:Theme.of(context).primaryColor,icon:  Icon(Icons.category,color: Colors.black,),title: Text('Categories',),),
        BottomNavigationBarItem(backgroundColor:Theme.of(context).primaryColor,icon: Icon(Icons.favorite_border,color: Colors.black,),title: Text('favourites'),)
    ],),
    );

  }
}
