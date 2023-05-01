import 'package:flutter/material.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
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
  );
}

Widget buttomBar() {
  return BottomAppBar(
    child: Row(
      children: [
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_checkout)),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    ),
  );
}

Widget mainDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Test'),
          accountEmail: Text('test@test.com'),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              // child: Image.asset("assets/img/mario03.png"),
              child: FlutterLogo(
                size: 42.0,
              ),
              backgroundColor: Colors.white,
            ),
            onTap: (() {
              showDialog(
                  context: context,
                  builder: ((context) => const AlertDialog(
                        content: Text("Click picture"),
                      )));
            }),
          ),
          otherAccountsPictures: <Widget>[
            CircleAvatar(
              child: Text("K"),
              foregroundColor: Colors.white,
              backgroundColor: Colors.pink,
            ),
            CircleAvatar(
              child: Icon(Icons.add),
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            )
          ],
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
  );
}
