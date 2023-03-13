import 'package:flutter/material.dart';

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
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) => const AlertDialog(
                            content: Text("Show Message"),
                          )));
                },
                icon: const Icon(Icons.add_alert))
          ],
          automaticallyImplyLeading: true,
          backgroundColor: Colors.green.shade700,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              Spacer(),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.shopping_cart_checkout)),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
          backgroundColor: Colors.green,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Text(
                  "My Profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Edit Profile"),
                  onTap: (() {
                    showDialog(
                        context: context,
                        builder: ((context) => const AlertDialog(
                              content: Text("Click profile"),
                            )));
                  })),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Setting"),
                  onTap: (() {
                    showDialog(
                        context: context,
                        builder: ((context) => const AlertDialog(
                              content: Text("Click setting"),
                            )));
                  })),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log out"),
              )
            ],
          ),
        ),
// Body - only child
        // body: Center(
        //   child: Text("Hello world"),
        // ),
// Body - multiple children
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
            ],
          ),
        ));
  }
}
