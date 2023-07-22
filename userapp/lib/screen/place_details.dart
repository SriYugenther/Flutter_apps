import 'package:flutter/material.dart';
import 'package:userapp/models/place.dart';

class PlaceDetails extends StatelessWidget {
  PlaceDetails({super.key, required this.place});

  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(children: [
        Image.file(
          place.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        )
      ]),
    );
  }
}
