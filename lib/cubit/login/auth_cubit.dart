import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/cubit/login/auth_state.dart';
import 'package:surveyapp/cubit/register/register_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(AuthInitialState());
  final FirebaseAuth auth=FirebaseAuth.instance;
  final dbReference=FirebaseFirestore.instance.collection('users');
  void login(String email,String password) async{
    try{
      emit(AuthLoadingState());
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      emit(AuthSuccessState());
    }catch(e){
      emit(AuthFailureState('Login Failed'));
    }
  }
}
