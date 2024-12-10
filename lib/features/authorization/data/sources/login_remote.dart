


import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/features/authorization/data/models/user_model.dart';

import '../../../../core/Failure/failure.dart';

abstract class LoginRemote{
  Future<UserModel> signIn({
    required String email,
    required String password
  }
      );
  Future<UserModel> signUp(
      {
        required String email,
        required String username,
        required String password,
        required String name
      }
      );
}
class LoginRemoteImpl implements LoginRemote{
  @override
  Future< UserModel> signIn({required String email, required String password}) async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      Map<String,dynamic> data = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid.toString()).get() as Map<String,dynamic>;
      return UserModel.fromJson(data);



  }

  @override
  Future<UserModel> signUp({required String email, required String username, required String password, required String name}) async {
      
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
       await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid.toString()).set(
           {
             'email' : email,
             'username' : username,
             'name' : name,
             'password' : password
           });
       return UserModel(email: email, password: password);

  }

}