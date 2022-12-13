
class StudentModal {
  late String? userId;
  late String username;
  late String email;
  late String password;
  late String confirmpassword;

  StudentModal(
      { this.userId,
      required this.username,
      required this.email,
      required this.password,
      required this.confirmpassword,
      userid});

  StudentModal.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    confirmpassword = json['confirmpassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmpassword'] = this.confirmpassword;
    return data;
  }
  
}