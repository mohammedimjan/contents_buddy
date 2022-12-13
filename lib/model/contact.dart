class Contact {
  int? id;
  String? name;
  String? contact;
  String? email;

  contactMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['contact'] = contact!;
    mapping['email'] = email!;
    return mapping;
  }
}
