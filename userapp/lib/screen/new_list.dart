import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/provider/placeprovider.dart';
import 'package:userapp/widget/image.dart';
import 'package:userapp/widget/location.dart';

class NewItem extends ConsumerStatefulWidget {
  NewItem({super.key});

  @override
  ConsumerState<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends ConsumerState<NewItem> {
  var titlecontroller = TextEditingController();
  File? selimage;

  void addbutton() {
    final enteredtitle = titlecontroller.text;

    if (enteredtitle.isEmpty || selimage == null) {
      return;
    }
    ref.read(newplaceProvider.notifier).addplace(enteredtitle, selimage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Grocery"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                maxLength: 40,
                controller: titlecontroller,
                decoration: const InputDecoration(label: Text("Title")),
              ),
              const SizedBox(
                height: 10,
              ),
              ImageInput(
                onpickedimage: (image) {
                  selimage = image;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              LocationInput(),
              const SizedBox(
                height: 10,
              ),
              TextButton.icon(
                onPressed: addbutton,
                icon: const Icon(Icons.add),
                label: const Text("AddPlace"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
