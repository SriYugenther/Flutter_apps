import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataScreen extends StatelessWidget {
  DataScreen({super.key, required this.voltage, required this.current});

  List<double> voltage;
  List<double> current;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Graphdata"),
          backgroundColor: Color.fromARGB(255, 71, 119, 202)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 5, 62, 109),
                borderRadius: BorderRadius.circular(26)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      for (final voltages in voltage)
                        Text("Voltage: " + voltages.toString(),
                            style: GoogleFonts.sriracha(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final currents in voltage)
                        Text("Current: " + currents.toString(),
                            style: GoogleFonts.sriracha(color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
