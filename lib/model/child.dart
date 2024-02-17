class Child {
  String? name, date, phone;

  Child.fromJson(Map map) {
    name = map['name'];
    date = map['date'];
    phone = map['phone'];
  }
}
