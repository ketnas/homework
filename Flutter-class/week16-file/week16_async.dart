// function that returns a future
Future<String> getUserName() async {
  return Future.delayed(Duration(seconds: 2), () => 'Hello');
}

void getData() async {
  String data = await middleFunction();
  print(data);
}

Future<String> middleFunction() {
  return Future.delayed(Duration(seconds: 5), () => "Hello world");
}

void getData_2() async {
  try {
    String data = await middleFunction();
    print(data);
  } catch (err) {
    print("Some error $err");
  }
}

// main function
void main() {
  // print("First Operation");
  // Future.delayed(Duration(seconds: 3), () => print('Second Big Operation'));
  // print("Third Operation");
  // print("Last Operation");

  // future in dart, using then
  // print("Start");
  // getUserName().then((value) => print(value));
  // print("End");

  // using await
  // print("Start");
  // getData();
  // print("End");

  // try-catch
  print("Start");
  getData_2();
  print("End");
}
