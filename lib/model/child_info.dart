class ChildInfo {
  String? name, bd, phone, progress, date;
  List? vcs = [];
  int? id;

  ChildInfo.fromJson(Map map) {
    name = map['name'];
    bd = map['bd'];
    vcs = map['vcs'];
    phone = map['phone'];
    id = map['id'];
    progress = map['progress'];
    date = map['date'];
  }
}
