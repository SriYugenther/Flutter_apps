import 'package:mealsapps/widget/Categorygrid.dart';

//import './catagorytype.dart';
import 'package:flutter/material.dart';
import 'package:mealsapps/models/catagorytype.dart';
import 'package:mealsapps/data/data.dart';
import 'package:mealsapps/models/mealdata.dart';
import 'package:mealsapps/screen/meals.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(
      {super.key, required this.addremovefood, required this.availablefood});

  final void Function(Meal meal) addremovefood;
  final List<Meal> availablefood;

  void selectcategory(BuildContext context, Category category) {
    //in stateful widget context object was gloably available
    // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const MealScreen(title: "some title", meals: [])));

    //filtering the dummy meals based on the id
    var filteredlist = availablefood
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
            title: category.title,
            meals: filteredlist,
            addremovefood: addremovefood),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*final categrylist =  [
      Category(id: "1", title: "Tiffen"),
      Category(id: "2", title: "Chinese"),
      Category(id: "3", title: "Chetinad"),
      Category(id: "4", title: "Tandoories"),
      Category(id: "5", title: "Chicken"),
    ];*/

    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        //you can give any variable name in place of category this is just like i in for loop
        for (final category in categorylist)
          CategoryGrid(
              category: category,
              ontap: () {
                selectcategory(context, category);
              }),
      ],
    );
  }
}
