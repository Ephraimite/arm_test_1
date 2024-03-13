class UserModel {
  String firstName;
  String userId;
  String lastName;
  String email;
  String password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userId,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'userId': userId,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}
