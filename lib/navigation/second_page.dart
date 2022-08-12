import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String data;
  const SecondPage(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: const Text('Second Page'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'This is Second Page',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, padding: const EdgeInsets.all(10)),
                child: const Text(
                  'Go Back',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Data => $data',
                style: const TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
