class PostRegister {
  String? password;
  String? email;
  String? name;

  PostRegister({this.password, this.email, this.name});

  PostRegister.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (password != null) {
      data['password'] = password;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (name != null) {
      data['name'] = name;
    }
    return data;
  }
}
