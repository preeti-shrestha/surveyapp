import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/cubit/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit():super(RegisterInitialState());
  final FirebaseAuth auth=FirebaseAuth.instance;
  final dbReference = FirebaseFirestore.instance.collection('users');
  Future<void> register({required String name,required String email,
    required String address,required String gender,required String password,
  }) async{
    try{
      emit(RegisterLoadingState());
      UserCredential userCredential= await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      String userId = userCredential.user!.uid;
      await dbReference.doc(userId).set({
        'id':userId,
        'name':name,
        'email':email,
        'address':address,
        'gender':gender,
        'status':'inactive',
        'createdAt':Timestamp.now(),
      });
      emit(RegisterSuccessState());
    }on FirebaseAuthException catch(e){
      emit(RegisterFailureState(e.message??'RegistrationFailed'));
    }catch(e){
      emit(RegisterFailureState('Something went wrong'));
    }
  }
}
