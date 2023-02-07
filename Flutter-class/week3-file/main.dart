import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
          actions: <Widget>[
            IconButton(onPressed: null, icon: Icon(Icons.add_alert))
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green.shade700,
        ),
        bottomNavigationBar: BottomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Hello World",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue.shade500, fontSize: 30.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
