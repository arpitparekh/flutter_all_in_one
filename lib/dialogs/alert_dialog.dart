import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyDialogApp(),
    ),
  );
}

class MyDialogApp extends StatelessWidget {
  const MyDialogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: const Text('Alert Dialog'),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      body: MyAlertDialog(),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(primary: Colors.green[900]),
        child: const Text('Show Dialog'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: AlertDialog(
                  backgroundColor: Colors.green[400],
                  title: const Text('This is Alert Dialog title'),
                  elevation: 5,
                  content: const Text('This is Description'),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[900]),
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[900]),
                        child: const Text('Ok'),
                        onPressed: () {
                          var snackBar = SnackBar(
                            elevation: 5,
                            backgroundColor: Colors.green[900],
                            content: const Text('Yay! A SnackBar!'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
