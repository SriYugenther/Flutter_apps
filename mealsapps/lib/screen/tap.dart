import 'package:flutter/material.dart';
import 'package:mealsapps/data/data.dart';
import 'package:mealsapps/models/mealdata.dart';
import 'package:mealsapps/screen/cataegories.dart';
import 'package:mealsapps/screen/filterscreen.dart';
import 'package:mealsapps/screen/meals.dart';
import 'package:mealsapps/widget/drawer.dart';

var kIntialFilter = {
  Filter.gluten: false,
  Filter.lactose: false,
  Filter.veg: false,
  Filter.vegan: false,
};

class TapScreen extends StatefulWidget {
  const TapScreen({super.key});

  @override
  State<TapScreen> createState() {
    return _TapScreenState();
  }
}

class _TapScreenState extends State<TapScreen> {
  int selectedpageindex = 0;

  final List<Meal> favoritelist = [];
  Map<Filter, bool> selectedfilter = kIntialFilter;

  void showinfomessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void addremovefourite(Meal meals) {
    final isExisting = favoritelist.contains(meals);

    if (isExisting) {
      setState(() {
        favoritelist.remove(meals);
        showinfomessage("Favourite Removed!!");
      });
    } else {
      setState(() {
        favoritelist.add(meals);
        showinfomessage("Favourite added!!");
      });
    }
  }

  void changescreen(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  void draweridentifier(String identifier) async {
    //this pop is used to come back to the original screen
    Navigator.of(context).pop();
    if (identifier == "filters") {
      //if we use push then the screen will be addded on stack so if we give back button it will go to previous shown screen
      //so if we want to replace the screen to current screen and dont want to use back button use pushreplacement instaed of only push
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FilterScreen(currentfilter: selectedfilter),
        ),
      );
      setState(() {
        //?? is used to shech whether the result is null if null execute kinitialfilter
        //if not null then execute result
        selectedfilter = result ?? kIntialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availablemeals = dummyMeals.where((element) {
      if (selectedfilter[Filter.gluten]! && !element.isGlutenFree) {
        return false;
      }
      if (selectedfilter[Filter.lactose]! && !element.isLactoseFree) {
        return false;
      }
      if (selectedfilter[Filter.veg]! && !element.isVegetarian) {
        return false;
      }
      if (selectedfilter[Filter.vegan]! && !element.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activepage = MainScreen(
      addremovefood: addremovefourite,
      availablefood: availablemeals,
    );
    var activepagetitle = "categories";

    if (selectedpageindex == 1) {
      activepage = MealScreen(
        meals: favoritelist,
        addremovefood: addremovefourite,
      );
      activepagetitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: MainDrawer(identifiers: draweridentifier),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedpageindex,
        onTap: (index) {
          changescreen(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
