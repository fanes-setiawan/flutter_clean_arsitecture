import 'package:testapp/domain/entities/user_entity.dart';
import 'package:testapp/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<void> register (UserEntity user)async{
    await Future.delayed(Duration(seconds: 2));
    print('user registered : ${user.email}');
  }
}