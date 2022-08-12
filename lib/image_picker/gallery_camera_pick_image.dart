import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

// pub.dev package image_picker

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PickImage(),
  ));
}

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? file;

  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) {
        return;
      }

      final imageTemp = File(image.path);

      setState(() {
        file = imageTemp;
      });
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) {
        return;
      }

      final imageTemp = File(image.path);

      debugPrint('file type is ${image.path.runtimeType}');

      setState(() {
        file = imageTemp;
      });
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: const Text('Pick Image'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            file == null
                ? const Text(
                    'There is No Image Selected',
                    style: TextStyle(fontSize: 20),
                  )
                : Image.file(
                    file!,
                    width: 200,
                    height: 200,
                  ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                pickImageGallery();
              },
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              child: const Text(
                'From Gallery',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                pickImageCamera();
              },
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              child: const Text(
                'From Camera',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
