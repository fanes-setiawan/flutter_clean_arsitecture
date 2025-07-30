import 'package:testapp/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String name,
    required String email,
    required String password,
  }) : super(name: name, email: email, password: password);

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password};
  }
}
