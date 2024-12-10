

import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/features/authorization/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  const UserModel({
    required this.email,
    this.username,
    required this.password,
    this.name
  }) : super(email: email,password: password);
  final String email;
  final String? username;
  final String password;
  final String? name;
  factory UserModel.fromJson(Map<String,dynamic> json) => UserModel(email: json['email'], password: json['password']);
}
