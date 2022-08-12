import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// pub.dev package shared_preferences

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyPreference(),
  ));
}

class MyPreference extends StatefulWidget {
  const MyPreference({Key? key}) : super(key: key);

  @override
  State<MyPreference> createState() => _MyPreferenceState();
}

class _MyPreferenceState extends State<MyPreference> {
  late SharedPreferences preferences;
  String? data = '';
  TextEditingController userInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future initialize() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('String Shared Preferences'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: userInput,
                decoration: const InputDecoration(
                  labelText: 'Please Enter Something',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                preferences.setString('myKey', userInput.text);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 40),
                primary: Colors.blueGrey,
              ),
              child: const Text(
                'Store',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  data = preferences.getString('myKey');
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 40),
                primary: Colors.blueGrey,
              ),
              child: const Text(
                'Retrieve',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.blueGrey[200],
              child: Center(
                child: Text(
                  data!,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
