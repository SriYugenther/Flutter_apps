import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.identifiers});

  final void Function(String identifiers) identifiers;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 48,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  "cooking Up!!",
                  style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              identifiers("meals");
            },
            leading: const Icon(
              Icons.restaurant,
              size: 26,
              color: Colors.white,
            ),
            title: Text(
              'Meals',
              style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {
              identifiers("filters");
            },
            leading: const Icon(
              Icons.settings,
              size: 26,
              color: Colors.white,
            ),
            title: Text(
              'Filters',
              style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
