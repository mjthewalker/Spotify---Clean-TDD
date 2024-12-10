
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/authorization/data/models/user_model.dart';
import 'package:spotify/features/authorization/domain/entities/user_entity.dart';
import 'package:spotify/features/authorization/domain/repositories/autho_repo.dart';

import '../../../../core/Failure/failure.dart';
import '../../../../injection_container.dart';

class CreateUserUsecase implements Usecase<UserModel,LoginParams,Failure>{

  @override
  Future<Either<Failure,UserModel>> call(LoginParams loginParams) async {
    return await sl<AuthRepo>().signIn(email: loginParams.email, password: loginParams.password);

  }

}
class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}