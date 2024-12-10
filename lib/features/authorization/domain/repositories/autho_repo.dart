import 'package:dartz/dartz.dart';
import 'package:spotify/features/authorization/data/models/user_model.dart';
import 'package:spotify/features/authorization/domain/entities/user_entity.dart';
import '../../../../core/Failure/failure.dart';
abstract class AuthRepo{
  const AuthRepo();
  Future<Either<Failure,UserModel>> signIn({
    required String email,
    required String password
  }
      );
  Future<Either<Failure,UserModel>> signUp(
      {
        required String email,
        required String username,
        required String password,
        required String name
      }
      );
}