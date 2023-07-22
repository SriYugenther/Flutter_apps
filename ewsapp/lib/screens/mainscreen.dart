import 'dart:convert';

import 'package:ewsapp/screens/graphscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> users = [];
  List<String> date = [];
  String dates = '';
  var isloading = false;

  @override
  void initState() {
    super.initState();
    // loadeditems = loaditems();
    loaddata();
  }

  void loaddata() async {
    try {
      setState(() {
        isloading = true;
      });

      final url = Uri.parse("https://nsl.n-warehouse.com/view");
      final response = await http.get(url);
      final /*Map<String, dynamic>*/ listdata = json.decode(response.body);
      setState(() {
        users = listdata;
      });
      setState(() {
        isloading = false;
      });
      // final List<Data> loadeditems = [];
      // for (final item in listdata.entries) {
      //   loadeditems.add(Data(
      //       id: item.value['id'],
      //       date: item.value['TimeStamp'],
      //       data: item.value['file_contents']));
      // }

      print("fetched data");
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("Ews App"),
      ),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Graph(data: users[index]['file_contents']),
                  ));
                },
                leading: CircleAvatar(
                  radius: 20,
                  child: Text(
                    users[index]['id'].toString(),
                  ),
                ),
                title: Card(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Text(
                      users[index]['TimeStamp']
                          .toString()
                          .replaceAll(RegExp("[A-Z]"), " ")
                          .characters
                          .take(19)
                          .toString(),
                      style: GoogleFonts.sriracha(),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
