import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mealsapps/models/mealdata.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key, required this.meals, required this.addremovefood});

  final Meal meals;
  final void Function(Meal meal) addremovefood;

  @override
  Widget build(BuildContext context) {
    var myicon = Icon(Icons.star_outline);

    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
              onPressed: () {
                addremovefood(meals);
              },
              icon: const Icon(Icons.star_outline_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              meals.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Ingredients",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),

            /* Expanded(
              child: ListView.builder(
                itemCount: meals.ingredients.length,
                itemBuilder: (context, index) => Text(
                  meals.ingredients[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),*/

            for (final meal in meals.ingredients)
              Text(meal,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Text("steps",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            for (final step in meals.steps)
              Text(
                step,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
