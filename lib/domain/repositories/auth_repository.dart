import 'package:testapp/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> register(UserEntity user);
}