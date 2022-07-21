class CoffeeUser {
  final String uid;

  CoffeeUser({this.uid = ""});
}

class UserData {
  String uid = "";
  String name = "";
  String sugars = "";
  int strength = 100;

  UserData(
      {this.uid = "", this.sugars = "", this.strength = 100, this.name = ""});
}
