import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapps/models/mealdata.dart';
import 'package:mealsapps/widget/mealitemtrait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem({super.key, required this.meal, required this.ontapfood});

  final Meal meal;
  final void Function() ontapfood;

  //since complexity and affordability are enum we can not convert it into string directly
  String get complexitytext {
    return meal.complexity.name.toString();
  }

  String get affordabilitytext {
    return meal.affordability.name.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: ontapfood,

        //stack is a widget used to display widget one above the other
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),

            //this widget is used to position the widget on the above widget
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 44),
                child: Column(children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.abel(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealItemTrait(
                          icon: Icons.schedule, label: '${meal.duration} min'),
                      const SizedBox(
                        width: 12,
                      ),
                      MealItemTrait(icon: Icons.work, label: complexitytext),
                      const SizedBox(
                        width: 12,
                      ),
                      MealItemTrait(
                          icon: Icons.money, label: affordabilitytext),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
