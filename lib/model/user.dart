// ignore_for_file: unnecessary_null_in_if_null_operators

class User {
  int? id;
  String? name;
  String? number;
  String? email;

  // ignore: duplicate_ignore
  userMap() {
    // ignore: prefer_collection_literals
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name ?? null;
    mapping['number'] = number ?? null;
    mapping['email'] = email ?? null;
    return mapping;
  }
}
