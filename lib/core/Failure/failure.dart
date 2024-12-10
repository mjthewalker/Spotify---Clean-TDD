import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message,required this.statusCode});
  final String message;
  final String statusCode;
  @override
  List<Object> get props => [message,statusCode];
}
class FirebaseException1 extends Failure{
  const FirebaseException1({required this.message,required this.statusCode}) : super(message: '', statusCode: '0');
  final String message;
  final String statusCode;
}