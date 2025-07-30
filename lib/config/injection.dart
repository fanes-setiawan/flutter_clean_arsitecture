import 'package:get_it/get_it.dart';
import 'package:testapp/data/repositories/auth_repository_impl.dart';
import 'package:testapp/domain/repositories/auth_repository.dart';
import 'package:testapp/domain/usecases/register_usecase.dart';
import 'package:testapp/presentation/blocs/register_bloc/register_bloc.dart';

final sl = GetIt.instance;

void init(){
  //repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  //usecase
  sl.registerLazySingleton(()=>RegisterUseCase(sl()));

  //bloc
  sl.registerFactory(()=>RegisterBloc(sl()));

}