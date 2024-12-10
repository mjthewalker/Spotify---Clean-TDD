import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  const UserEntity({
    required this.email,
    this.username,
    required this.password,
    this.name
  });
  final String email;
  final String? username;
  final String password;
  final String? name;

  @override

  List<Object?> get props => [username,email];
}

