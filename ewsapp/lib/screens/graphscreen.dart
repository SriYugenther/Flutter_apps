import 'package:ewsapp/graph/linechart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:ewsapp/screens/datascreen.dart';

List<double> doublecurrent = [];
List<double> doublevoltage = [];

class Graph extends StatelessWidget {
  Graph({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    List<String> words = [];
    List<String> voltage = [];
    List<String> current = [];

    words = data.split(RegExp(r'[ \n]'));
    for (int i = 0; i < words.length; i += 2) {
      voltage.add(words[i]);
    }
    for (int i = 1; i < words.length; i += 2) {
      current.add(words[i]);
    }
    doublevoltage = voltage.map((str) {
      try {
        return double.parse(str);
      } catch (e) {
        // Handle invalid input, such as providing a default value
        return 0.0; // Default value for invalid input
      }
    }).toList();

    doublecurrent = current.map((str) {
      try {
        return double.parse(str);
      } catch (e) {
        // Handle invalid input, such as providing a default value
        return 0.0; // Default value for invalid input
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 71, 119, 202),
        title: const Text("Graph"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("Data"),
          backgroundColor: Color.fromARGB(255, 71, 119, 202),
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  DataScreen(voltage: doublevoltage, current: doublecurrent),
            ));
          }),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: width < 600
              ? Column(
                  children: [
                    Expanded(child: LineChartWidget(points: graphpoint)),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: LineChartWidget(points: graphpoint)),
                  ],
                )),
    );
  }
}

class GraphPoint {
  GraphPoint({required this.x, required this.y});
  final double x;
  final double y;
}

List<GraphPoint> get graphpoint {
  return doublecurrent
      .mapIndexed(
          (index, element) => GraphPoint(x: doublevoltage[index], y: element))
      .toList();
}
