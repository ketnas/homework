import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter mySQL', home: MyInputScreen());
  }
}

String _localhost() {
  if (Platform.isAndroid)
    return 'http://10.0.2.2:3000';
  else // for iOS simulator
    return 'http://localhost:3000';
}

class MyInputScreen extends StatelessWidget {
  const MyInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreen createState() => _InputScreen();
}

//Creating a class to store the data;
class Item {
  final int? id;
  final String? username;
  final String? password;

  Item({
    this.id,
    this.username,
    this.password,
  });
}

class _InputScreen extends State<InputScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  Future? serverResponse;

  void addData() async {
    final response = await http.post(
      Uri.parse(_localhost() + "/addDB"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username.text,
        'password': password.text
      }),
    );
  }

  void updateData() async {
    final response = await http.post(
      Uri.parse(_localhost() + "/updateDB"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username.text,
        'password': newpassword.text
      }),
    );
  }

  Future<List<Item>> showData() async {
    final response = await http.get(Uri.parse(_localhost() + "/showDB"));

    var responseData = json.decode(response.body);
    //Creating a list to store input data;
    List<Item> items = [];
    responseData.forEach((index, value) {
      Item item = Item(
          id: value["id"],
          username: value["username"],
          password: value["password"]);
      items.add(item);
    });

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Container(
            // height: 50,
            color: Colors.amber[500],
            child: Padding(
              padding: EdgeInsets.all(10),
              child: const Center(child: Text('Add Data')),
            ),
          ),
        ),
        Column(children: <Widget>[
          TextField(
            controller: username,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: (() {
              debugPrint(username.text);
              addData();
            }),
            child: Text("OK"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          ),
        ]),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Container(
            // height: 50,
            color: Colors.amber[500],
            child: Padding(
              padding: EdgeInsets.all(10),
              child: const Center(child: Text('Update Data')),
            ),
          ),
        ),
        Column(children: <Widget>[
          TextField(
            controller: username,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: newpassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'New Password',
            ),
          ),
          ElevatedButton(
            onPressed: (() {
              debugPrint(newpassword.text);
              updateData();
            }),
            child: Text("OK"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          ),
        ]),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Container(
            // height: 50,
            color: Colors.amber[500],
            child: Padding(
              padding: EdgeInsets.all(10),
              child: const Center(child: Text('Delete Data')),
            ),
          ),
        ),
        Column(children: <Widget>[
          TextField(
            controller: username,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: (() {}),
            child: Text("OK"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          ),
        ]),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Container(
            // height: 50,
            color: Colors.amber[500],
            child: Padding(
              padding: EdgeInsets.all(10),
              child: const Center(child: Text('Show Data')),
            ),
          ),
        ),
        Column(children: <Widget>[
          ElevatedButton(
            onPressed: (() {
              // debugPrint(username.text);
              setState(() {
                serverResponse = showData();
              });
            }),
            child: Text("Show data"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
        FutureBuilder(
            future: serverResponse,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("No data"),
                    // child: CircularProgressIndicator(),
                  ),
                );
              } else {
                debugPrint(snapshot.data.toString());
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(snapshot.data[index].id.toString()),
                            Text(snapshot.data[index].username),
                            Text(snapshot.data[index].password)
                          ],
                        ),
                      );
                    }));
              }
            })
      ],
    );
  }
}
