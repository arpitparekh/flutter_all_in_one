import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      body: const Center(
        child: Text(
          'Error Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
