// activity 1

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

// activity 2

body: Column(
        children: <Widget>[
          Container(
            height: 150,
            color: Colors.black,
          ),
          Container(
            height: 150,
            color: Colors.pink,
          ),
          Container(
            height: 150,
            color: Colors.yellow,
          ),
          Container(
            height: 150,
            color: Colors.blue,
          ),
          Container(
            height: 150,
            color: Colors.green,
          ),
          Container(
            height: 150,
            color: Colors.grey,
          ),
          Container(
            height: 150,
            color: Colors.orange,
          ),
        ],
      ),