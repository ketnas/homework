import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

//Creating a class to store the data;
class Item {
  final String? brandname;
  final int? price;

  final String? pic;

  Item({
    this.brandname,
    this.price,
    this.pic,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

  Future<List<Item>> getRequest() async {
    //replace your restFull API here.
    String url = "https://mocki.io/v1/a463a7a1-62ba-4be4-9ab9-baf7d9b61eec";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Item> items = [];
    for (var singleItem in responseData) {
      Item item = Item(
          brandname: singleItem["brandname"],
          price: singleItem["price"],
          pic: singleItem["pic"]);

      //Adding user to the list.
      items.add(item);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Week 16: HTTP Get Request."),
          // leading: Icon(
          //   Icons.get_app,
          // ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: ((context, index) {
                    return Container(
                        padding: EdgeInsets.all(2),
                        height: 140,
                        child: Card(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset(
                                    "assets/pic/${snapshot.data[index].pic}"),
                                Expanded(
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(snapshot.data[index].brandname,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "Price: ${snapshot.data[index].price.toString()}"),
                                          ],
                                        )))
                              ]),
                        ));
                  }),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
