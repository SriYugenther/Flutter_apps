import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onpickedimage});

  final void Function(File image) onpickedimage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? selectedimage;

  void _takepic() async {
    final pickedimage = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxHeight: 600);

    if (pickedimage == null) {
      return;
    }
    setState(() {
      selectedimage = File(pickedimage.path);
    });
    widget.onpickedimage(selectedimage!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          border:
              Border.all(width: 1, color: Color.fromARGB(255, 226, 222, 222))),
      child: selectedimage == null
          ? TextButton.icon(
              onPressed: _takepic,
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text("Camera"),
            )
          : GestureDetector(
              onTap: _takepic,
              child: Image.file(
                selectedimage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
    );
  }
}
