import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/provider/placeprovider.dart';
import 'package:userapp/screen/new_list.dart';
import 'package:userapp/screen/place_details.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends ConsumerState<MainScreen> {
  //late keyword tell this value is not set intially when class initiatedbut set before it is needed
  late Future<void> _placefuture;
  @override
  void initState() {
    super.initState();
    //now calling the loaddatabase from privider to display when the app loads
    _placefuture = ref.read(newplaceProvider.notifier).loadplaces();
  }

  void screenchange() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewItem(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final placelist = ref.watch(newplaceProvider);

    Widget content = const Center(
      child: Text("Add Places"),
    );

    if (placelist.isNotEmpty) {
      content = ListView.builder(
        itemCount: placelist.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return PlaceDetails(place: placelist[index]);
              },
            ));
          },
          title: Text(placelist[index].title),
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(placelist[index].image),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Grocery"),
          actions: [
            IconButton(onPressed: screenchange, icon: const Icon(Icons.add))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          //we are getting the stored value from the database using futurebuilder
          child: FutureBuilder(
              future: _placefuture,
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : content),
        ));
  }
}
