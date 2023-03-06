class Person {
  String? name;
  String? lastname;
  String? phone;
  int? age;

  // Default Constructor
  Person() {
    // กำหนดค่าในนี้ได้
    print("This is a default constructor");
  }

  // Named Constructor
  // Person.anotherConstructor(
  //     String name, String lastname, String phone, int age) {
  //   this.name = name;
  //   this.lastname = lastname;
  //   this.phone = phone;
  //   this.age = age;
  // }

  // Constructor in short form, ใช้แบบนี้ดีกว่า
  Person.anotherConstructor(this.name, this.lastname, this.phone, this.age);

  void displayInfo() {
    print("Person name: $name $lastname.");
    print("Phone number: $phone.");
    print("Age: $age.");
  }
}

class Person2 {
  // Private Properties
  String? _name;
  String? _lastname;
  String? _phone;
  int? _age;

  // Constructor in short form, ใช้แบบนี้ดีกว่า
  Person2(this._name, this._lastname, this._phone, this._age);

  // Getter to get full name
  String get fullName => "Hello, $_name $_lastname.";

  // Getter to read private property _age
  int? get age => _age;

  String get phone => "My phone number is $_phone.";

  // Setter to update private property _phone
  set phone(String phone) {
    try {
      if (phone.length < 2) {
        throw Exception("Phone number is not correct.");
      }
      _phone = phone;
    } on Exception catch (e) {
      print(e);
    }
  }
}

// Here In student class, we are extending the
// properties and methods of the Person class
class Student extends Person {
  // Fields
  String? schoolName;
  String? schoolAddress;

  Student() : super();

  Student.anotherConstructor(name, lastname, phone, age)
      : super.anotherConstructor(name, lastname, phone, age);

  // Method
  void displaySchoolInfo() {
    print("${super.name}'s School Name: $schoolName");
    print("School Address: $schoolAddress");
  }
}

class Teacher extends Person {
  // Fields
  String? expertise;
  String? schoolName;

  Teacher() : super();

  Teacher.anotherConstructor(name, lastname, phone, age)
      : super.anotherConstructor(name, lastname, phone, age);

  // Method
  @override
  void displayInfo() {
    print("${super.name}'s expertise: $expertise");
    print("School name: $schoolName");
  }
}

void main(List<String> args) {
  // Person a = Person();
  // a.name = "Jane";
  // a.lastname = "Doe";
  // a.age = 25;
  // a.phone = "0214563";
  // a.displayInfo();

  // Person b = Person.anotherConstructor("John", "Doe", "0321456", 30);
  // b.displayInfo();

  // Getter and setter
  // Person2 c = Person2("Jane", "Doe", "02145", 27);
  // print(c.fullName);
  // print("I am ${c.age} years old");
  // c.phone = "0";
  // print(c.phone);

  // Creating an object of the Student class
  // var student = Student();
  // student.name = "John";
  // student.lastname = "Doe";
  // student.age = 20;
  // student.schoolName = "ABC School";
  // student.schoolAddress = "New York";
  // student.displayInfo();
  // student.displaySchoolInfo();

  // Super
  // var student2 = Student.anotherConstructor("John", "Doe", "0321456", 20);
  // student2.schoolName = "XYZ School";
  // student2.schoolAddress = "New York";
  // student2.displayInfo();
  // student2.displaySchoolInfo();

  // Override
  // var teacher = Teacher.anotherConstructor("Jim", "Doe", "0321456", 35);
  // teacher.schoolName = "XYZ School";
  // teacher.expertise = "Math";
  // teacher.displayInfo();
}
