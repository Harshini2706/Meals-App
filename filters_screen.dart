import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/widget/main_drawer.dart';

class Filter extends StatefulWidget {

  static const routeName = '/Filter';
final Function saveFilters;
final Map<String,bool>currentFilters;
Filter(this.currentFilters,  this.saveFilters);


  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _glutenFree=false;
  bool _vegeterian=false;
  bool _vegan=false;
  bool _lactoseFree=false;

  Widget _buildSwitchListTile(String title,String description,bool currentValue,Function updateValue){
    return SwitchListTile(title: Text(title),value: currentValue,subtitle: Text(description),onChanged: updateValue);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      actions: [IconButton(icon: Icon(Icons.save),onPressed:(){
    final  selectedfilters={
      'gluten':_glutenFree,
      'lactose':_lactoseFree,
      'vegan':_vegan,
      'vegeterian':_vegeterian,
    };widget.saveFilters(selectedfilters);
  },)],
      ),
     drawer: MainDrawer(),
      body: Column(

        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Select your ingredient',style: GoogleFonts.chelseaMarket(),),
          ),
          Expanded(child: ListView(children: [
            _buildSwitchListTile('Gluten-Free','Only gluten Free meals Included',_glutenFree,(newValue){setState((){
              _glutenFree=newValue;
            });}),
            _buildSwitchListTile('Vegeterian','Only Vegeterian meals Included',_vegeterian,(newValue){setState((){
              _vegeterian=newValue;
            });}),
            _buildSwitchListTile('Vegan','Only Vegan meals Included',_vegan,(newValue){setState((){
              _vegan=newValue;
            });}),
            _buildSwitchListTile('Lactose-Free','Only Lactose Free meals Included',_lactoseFree,(newValue){setState((){
             _lactoseFree=newValue;
            });}),


          ],))
        ],
      )
    );
  }
}
