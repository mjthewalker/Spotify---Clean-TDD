import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/Failure/failure.dart';
import 'package:spotify/features/authorization/data/models/user_model.dart';
import 'package:spotify/features/authorization/data/sources/login_remote.dart';
import 'package:spotify/features/authorization/domain/repositories/autho_repo.dart';

import '../../../../injection_container.dart';

class AuthRepoImpl extends AuthRepo{
  @override
  Future<Either<Failure, UserModel>> signIn({required String email, required String password}) async {
        try {
          UserModel data = await sl<LoginRemote>().signIn(email: email, password: password);
          return Right(data);
        } on FirebaseAuthException catch (e) {
           return Left(FirebaseException1(message: e.message ?? "",statusCode: e.code.toString() ?? '0'));
        }

  }

  @override
  Future<Either<Failure, UserModel>> signUp({required String email, required String username, required String password, required String name}) async {
    try {
      UserModel data = await sl<LoginRemote>().signUp(email: email, username: username, password: password, name: name);
      return  Right(data);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseException1(message: e.message ?? "",statusCode: e.code.toString() ?? '0'));
    }
  }
  
}