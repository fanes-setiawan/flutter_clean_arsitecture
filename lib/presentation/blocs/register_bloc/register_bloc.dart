import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testapp/domain/entities/user_entity.dart';
import 'package:testapp/domain/usecases/register_usecase.dart';
import 'package:testapp/presentation/blocs/register_bloc/register_state.dart';

part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterBloc(this.registerUseCase) : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit)async {
      emit(RegisterLoading());
      try {
        final user = UserEntity(
          name: event.name,
          email: event.email,
          password: event.password,
        );
        await registerUseCase(user);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterFailure('Register failed : $e'));
      }
    });
  }
}
