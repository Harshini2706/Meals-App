import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/widget/dummy_data.dart';
import '../widget/Category Item.dart';
class Category_Field extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GridView(padding: EdgeInsets.all(15.0),
        children: dummy.map((catData)=>Category_Item(catData.color,catData.title,catData.id,)).toList(),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20)
    );
  }
}
