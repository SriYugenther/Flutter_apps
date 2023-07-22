import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapps/screen/tap.dart';
import 'package:mealsapps/widget/drawer.dart';

enum Filter { gluten, lactose, veg, vegan }

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key, required this.currentfilter});

  final Map<Filter, bool> currentfilter;

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenfree = false;
  var lactosefree = false;
  var vegeterian = false;
  var vegan = false;

  @override
  void initState() {
    super.initState();
    glutenfree = widget.currentfilter[Filter.gluten]!;
    lactosefree = widget.currentfilter[Filter.lactose]!;
    vegeterian = widget.currentfilter[Filter.veg]!;
    vegan = widget.currentfilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      // drawer: MainDrawer(identifiers: (itendifier) {
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => const TapScreen(),
      //   ));
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluten: glutenfree,
            Filter.lactose: lactosefree,
            Filter.veg: vegeterian,
            Filter.vegan: vegan
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenfree,
              onChanged: (ischecked) {
                setState(() {
                  glutenfree = ischecked;
                });
              },
              title: Text(
                "Gluten-free",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                "Only Contains Gluten-free meals.",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 15),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactosefree,
              onChanged: (ischecked) {
                setState(() {
                  lactosefree = ischecked;
                });
              },
              title: Text(
                "Lactose-free",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                "Only Contains Lactose-free meals.",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 15),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegeterian,
              onChanged: (ischecked) {
                setState(() {
                  vegeterian = ischecked;
                });
              },
              title: Text(
                "Vegeterian",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                "Only Contains Vegeterian meals.",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 15),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegan,
              onChanged: (ischecked) {
                setState(() {
                  vegan = ischecked;
                });
              },
              title: Text(
                "vegan",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                "Only Contains Vegan meals.",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 15),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
