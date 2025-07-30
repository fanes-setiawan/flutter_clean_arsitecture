import 'package:testapp/domain/entities/user_entity.dart';
import 'package:testapp/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<void> call(UserEntity user)async{
    await repository.register(user);
  }
}