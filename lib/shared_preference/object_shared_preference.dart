import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// pub.dev package shared_preferences

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ObjectSharedPref(),
  ));
}

class ObjectSharedPref extends StatefulWidget {
  const ObjectSharedPref({Key? key}) : super(key: key);

  @override
  State<ObjectSharedPref> createState() => _ObjectSharedPrefState();
}

class _ObjectSharedPrefState extends State<ObjectSharedPref> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Object Shared Preference'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
            )
          ],
        ),
      ),
    );
  }
}
