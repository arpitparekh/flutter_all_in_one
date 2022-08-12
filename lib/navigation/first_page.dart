import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/navigation/route_generator.dart';

// use Navigator.push and MaterialPageRoutes
// use routes parameter in MaterialApp and Navigator.pushNamed()
// use on generateRoutes

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const FirstPage(),
    // routes: {'second': (context) => const SecondPage('abc')},
    onGenerateRoute: (settings) => RouteGenerator.generateRoutes(settings),
  ));
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange[100],
        appBar: AppBar(
          title: const Text('First Page'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'This is First Page',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const SecondPage();
                  //     },
                  //   ),
                  // );
                  Navigator.of(context)
                      .pushNamed('second', arguments: 'arguments');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                    padding: const EdgeInsets.all(10)),
                child: const Text(
                  'Go To Next Page',
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
