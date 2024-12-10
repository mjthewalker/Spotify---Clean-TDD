
import 'package:get_it/get_it.dart';
import 'package:spotify/features/authorization/data/repositories/auth_repo_impl.dart';
import 'package:spotify/features/authorization/data/sources/login_remote.dart';
import 'package:spotify/features/authorization/domain/usecases/login.dart';
import 'package:spotify/features/authorization/domain/usecases/signup.dart';

import 'features/authorization/domain/repositories/autho_repo.dart';

final sl =GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<LoginRemote>(
    LoginRemoteImpl()
  );
  sl.registerSingleton<AuthRepo>(
      AuthRepoImpl()
  );
  sl.registerSingleton<CreateUserUsecase>(
      CreateUserUsecase()
  );
  sl.registerSingleton<SignupUserUsecase>(
      SignupUserUsecase()
  );




}