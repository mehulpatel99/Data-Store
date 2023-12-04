class UserModel {
  int? id;
  String? name;
  String? subject;
  String? contact;

  UserMap() {
    var mapping = Map<String, dynamic?>();
    mapping['id'] = id ?? null;
    mapping['name'] = name;
    mapping['subject'] = subject;
    mapping['contact'] = contact;


    return mapping;
  }
}
