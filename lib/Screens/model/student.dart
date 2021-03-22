class Student {
  String uid;
  String id;
  String name;
  String email;
  String password;
  String qrcode;

  Student({ this.uid ,this.id, this.name, this.email, this.password, this.qrcode });

  Student.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        email = snapshot['email'] ?? '',
        password = snapshot['password'] ?? '',
        qrcode = snapshot['qrcode'] ?? '';

  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "qrcode": qrcode,
    };
  }
}
