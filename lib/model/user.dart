

class User{

  int? id;
  String? name;
  String? number;
  String? email;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name ?? null;
    mapping['number'] = number ?? null;
    mapping['email'] = email ?? null;
    return mapping;
  }
}