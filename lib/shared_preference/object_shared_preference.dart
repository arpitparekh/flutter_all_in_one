import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_all_in_one/shared_preference/user.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

// pub.dev package shared_preferences
// pub.dev package image_picker

// convert object into json string then store it into shared preference

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ObjectSharedPref(),
      routes: {'display': (context) => const ShowData()},
    ),
  );
}

class ObjectSharedPref extends StatefulWidget {
  const ObjectSharedPref({Key? key}) : super(key: key);

  @override
  State<ObjectSharedPref> createState() => _ObjectSharedPrefState();
}

class _ObjectSharedPrefState extends State<ObjectSharedPref> {
  File? _file;
  late String path;
  var nameControl = TextEditingController();
  var ageControl = TextEditingController();
  var addressControl = TextEditingController();
  late SharedPreferences preferences;

  Future getImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) {
        return;
      }

      final tempImage = File(image.path);

      setState(() {
        path = image.path;
        _file = tempImage;
      });
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  Future initialize() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: const Text('Object Shared Preference'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                _file != null
                    ? GestureDetector(
                        onTap: () {
                          getImageGallery();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurple[300],
                          backgroundImage: Image.file(
                            _file!,
                            fit: BoxFit.cover,
                          ).image,
                          radius: 100,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          getImageGallery();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurple[300],
                          radius: 100,
                          backgroundImage: const NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Plus_symbol.svg/500px-Plus_symbol.svg.png'),
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    controller: nameControl,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 3),
                      ),
                      labelText: 'Enter Name',
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    controller: ageControl,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 3),
                      ),
                      labelText: 'Enter Age',
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    controller: addressControl,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 3),
                      ),
                      labelText: 'Enter Address',
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                  onPressed: () {
                    User user = User(nameControl.text, ageControl.text,
                        addressControl.text, path);

                    final userJson = json.encode(user.toJson());

                    preferences.setString('user', userJson);
                  },
                  child: const Text(
                    'Store in Shared Preference',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                  onPressed: () {
                    if (preferences.getString('user') != null) {
                      Navigator.of(context).pushNamed('display');
                    }
                  },
                  child: const Text(
                    'Display Data',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  late SharedPreferences preferences;
  late User user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future initialize() async {
    preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('user');

    if (jsonData == null) return;

    final user = User.fromJson(json.decode(jsonData));
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        } else {
          return Scaffold(
            backgroundColor: Colors.red[200],
            appBar: AppBar(
              title: const Text('Data Stored in Shared Preferences'),
              centerTitle: true,
              backgroundColor: Colors.red,
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple[300],
                    backgroundImage: Image.file(
                      File(user.path),
                      fit: BoxFit.cover,
                    ).image,
                    radius: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.age,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.address,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
