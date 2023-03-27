import 'package:flutter/material.dart';
import 'widgets/widgets.dart';
import 'widgets/inputscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Welcome to Flutter', home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        bottomNavigationBar: buttomBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
          backgroundColor: Colors.green,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: mainDrawer(context),
// Body - multiple children
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  "assets/img/mario03.png",
                  width: 100,
                ),
              ),
              Text(
                "Hello World",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue.shade500, fontSize: 30.0),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "Hello ",
                          style: TextStyle(fontStyle: FontStyle.italic)),
                      TextSpan(
                          text: "World",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Image.asset(
                "assets/img/flutter-logo.png",
                width: 250,
              ),
              buttonNav(context),
            ],
          ),
        ));
  }
}
