import 'package:flutter/material.dart';
import 'package:mealsapps/data/data.dart';
import 'package:mealsapps/screen/foodlist.dart';
import 'package:mealsapps/models/mealdata.dart';
import 'package:mealsapps/widget/mealitem.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.addremovefood});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) addremovefood;

  void selectedfood(BuildContext context, Meal meals) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => FoodList(
                meals: meals,
                addremovefood: addremovefood,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
        child: Text(
      "The list is Empty",
      style: TextStyle(color: Colors.white),
    ));

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) => MealItem(
                meal: meals[index],
                ontapfood: () {
                  selectedfood(context, meals[index]);
                },
              ) //Text(meals[index].title),
          );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
